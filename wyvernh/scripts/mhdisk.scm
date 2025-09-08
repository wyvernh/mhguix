#!/usr/bin/env -S guile \\
-L ./ -e main -s
!#

# Usage: sudo mhdisk /path/to/system/hostname.scm

(define (partition-filename drive n)
  (if (string-contains-ci drive "nvme")
      (string-append drive "p" (number->string n))
      (string-append drive (number->string n))))

(define (print-partition partition)
  (display (assoc-ref 'type partition))
  (display "   ")
  (display (assoc-ref 'size partition))
  (display "   ")
  (display (assoc-ref 'label partition))
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
  (assoc-ref type
             '(("vfat" . "ef00")
               ("ext4" . "8300")
               ("btrfs" . "8300")
               ("linux-swap" . "8200"))))

(define (mkfs type)
  (assoc-ref type
             '(("vfat" . "mkfs.vfat")
               ("ext4" . "mkfs.ext4")
               ("btrfs" . "mkfs.btrfs")
               ("linux-swap" . "mkswap"))))

(define (wipe-disk drive)
  (system* "sgdisk" "-Z" drive)
  (system* "sgdisk" "-g" drive))

(define (sgdisk-n-string partition n)
  (string-append (number->string n) ":0:+" (assoc-ref 'size partition)))

(define (sgdisk-n-string partition n)
  (string-append (number->string n) ":" (partition-type (assoc-ref 'type partition))))

(define (add-partition drive partition n)
  (if zero? (system* "sgdisk"
                     "-n" (sgdisk-n-string partition n)
                     "-t" (sgdisk-t-string partition n)
                     drive)
      (if zero? (system* (mkfs (assoc-ref 'type partition))
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
      (display "Successfully partitioned disk\n")
      (if (= 1 code)
          (display "sgdisk error")
          (display "filesystem error")))
  (newline))
