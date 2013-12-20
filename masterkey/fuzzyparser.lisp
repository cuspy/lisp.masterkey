;; Copyright (C) c64bubble 2011

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 2 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;(defun make-fuzzy-parser (&optional msgl)
;;	#'(lambda (msgl)
;;	(cond ((eq (car msgl) 'parse-fo

(defun parse-for-typeX-rec (haystack i retstr previ delimiters)
  (cond ((>= i (length haystack))
         (list "" i));;end node of haystack
        (T (let* ((c (aref haystack i))
                  (r NIL)
                  (foo (mapcar #'(lambda (delimiter) (if (string= c delimiter) (setq r T))) delimiters)))
             (cond ((not (null r))
                    (do ((ii  (- i 1) (- ii 1)));;skip whitepspace
                        ((or (< ii previ)
                             (>= ii i))
                         (list (reverse retstr) i))
                      (setq retstr (concatenate 'string retstr (string (char haystack ii))))))
                   (T (parse-for-typeX-rec haystack (+ i 1) retstr previ delimiters)))))
        ))


(defun parse-for-typeX (haystack ii retl delimiters)
  (let* ((ret (parse-for-typeX-rec haystack ii "" ii delimiters))
         (retstr  (car ret))
         (reti (+ (cadr ret))))


    ;;(cond ((string= retstr "12345678") (print "FOO"))
    ;;	(T
    ;;		(when (= (+ reti 1) (length haystack))
    ;;		(print "FOO"))
    (cond ((< (+ reti 1) (length haystack))
           (parse-for-typeX haystack (+ reti 1) (append retl (list ret)) delimiters))
          (T
           retl))
    ))

;;))
(defun parse-for (haystack &optional delimitersl)
  (let ((haystack1 (concatenate 'string haystack '(#\space)))
        (delimiters (cond ((not (stringp delimitersl))
                           (list " " "\n"))
                          (T delimitersl))))
    (parse-for-typeX haystack1 0 () delimiters)
    ))
