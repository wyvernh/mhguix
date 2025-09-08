#!/usr/bin/env -S guile \\
-L ./ -e main -s
!#

# Usage: sudo mhdisk /path/to/system/hostname.scm

(define (partition-filename drive n)
  (if (string-contains-ci drive "nvme")
      (string-append drive "p" (number->string n))
      (string-append drive (number->string n))))

(define (print-partition partition)
  (display (assoc-ref partition 'type))
  (display "   ")
  (display (assoc-ref partition 'size))
  (display "   ")
  (display (assoc-ref partition 'label))
  (newline))

(define (print-disk-from drive partitions n)
  (when (not (null? partitions))
    (display (partition-filename drive n))
    (display "     ")
    (print-partition (car partitions))
    (print-disk-from drive (cdr partitions) (+ n 1))))

(define (print-disk drive layout)
  (display drive)
  (display ":\n")
  (print-disk-from drive layout 1))

(define (partition-type type)
  (assoc-ref '(("vfat" . "ef00")
               ("ext4" . "8300")
               ("btrfs" . "8300")
               ("linux-swap" . "8200"))
             type))

(define (mkfs type)
  (assoc-ref '(("vfat" . "mkfs.vfat")
               ("ext4" . "mkfs.ext4")
               ("btrfs" . "mkfs.btrfs")
               ("linux-swap" . "mkswap"))
             type))

(define (wipe-disk drive)
  (system* "sgdisk" "-Z" drive)
  (system* "sgdisk" "-g" drive))

(define (sgdisk-n-string partition n)
  (let size (assoc-ref partition 'size)
    (if (eq? size "*")
        (string-append (number->string n) ":0:0")
        (string-append (number->string n) ":0:+" size))))

(define (sgdisk-t-string partition n)
  (let type (assoc-ref partition 'type)
    (string-append (number->string n) ":" (partition-type type)))

(define (add-partition drive partition n)
  (if zero? (system* "sgdisk"
                     "-n" (sgdisk-n-string partition n)
                     "-t" (sgdisk-t-string partition n)
                     drive)
      (if zero? (system* (mkfs (assoc-ref partition 'type))
                         (partition-filename drive n))
          0
          2)
      1))

(define (partition-disk-from drive partitions n)
  (if (null? partitions)
      0
      (let code (add-partition drive (car partitions) n)
        (if (zero? code)
            (partition-disk-from drive (cdr partitions) (+ n 1))
            code))))

(define (partition-disk drive layout)
  (partition-disk-from drive layout 1))

(define (main args)
  (load (car (cdr args)))
  (define drive (car disk))
  (define layout (car (cdr disk)))
  (display "Partitioning according to disk layout:\n")
  (print-disk drive layout)
  (define code (partition-disk drive layout))
  (if (zero? code)
      (begin
        (display "Successfully partitioned disk\n")
        EXIT_SUCCESS)
      (begin
        (if (= 1 code)
            (display "sgdisk error\n")
            (display "filesystem error\n"))
        EXIT_FAILURE)))
