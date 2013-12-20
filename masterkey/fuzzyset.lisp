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


;; EXAMPLE CODE :
;;(load "fuzzyset.lisp")
;;(defvar fa (make-fuzzy-set))
;;(funcall fa (list 'init "123"))

;; DOCS
;; 1. init a make-fuzzy-set with a name
;; 2. add rule values and types
;; 3. reason with the rule system

(defun make-fuzzy-set (&optional msgl)
  (let ((*name (when (not (null msgl)) (car msgl)))
        (*set-types ()) ;; e.g "low medium high"
        (*set-values ())) ;; e.g. probability, bayes

    #'(lambda (msgl)
        (cond ((eq (car msgl) 'init) (print "init fuzzy set : ")(print (cadr msgl))(setq *name (cadr msgl)))
              ((eq (car msgl) 'add-rule-type)
               (setq *set-types (append *set-types (list (cadr msgl))))

               )
              ((eq (car msgl) 'add-rule-value)
               (setq *set-values (append *set-values (list (cadr msgl))))

               )
              (T (print "Fuzzy Set : message not understood : ")(print msgl))))
    ))

(defun make-rule (&optional msgl)
  (let ((*typeX "")
        (*type2 ""))

    #'(lambda (msgl)
        (cond ((eq (car msgl) 'init)(setq *typeX (parse-for-typeX (cadr msgl)))(setq *type2 (parse-for-type2 (cadr msgl)))
               )
              (t (print "Rule : message not understood : ")(print msgl))))
    ))

(defun make-fuzzy-rule-set (&optional msgl)
  (let ((*fuzzy-set (make-fuzzy-set (when (not (null msgl)) (car msgl)))))

    #'(lambda (msgl)
        (cond ((eq (car msgl) 'init)(funcall *fuzzy-set (list 'init (cadr msgl))))
              ((eq (car msgl) 'add-rule-variables)
               (funcall *fuzzy-set (list 'add-rule-type (cadr msgl)))
               (funcall *fuzzy-set (list 'add-rule-value (caddr msgl))))
              (t (print "Fuzzy Rule Set : message not understood")(print msgl))))
    ))


(defun make-fuzzy-rule-system (&optional msgl)
  (let ((*fuzzy-sets ()))
    #'(lambda (msgl)
        (cond ((eq (car msgl) 'init) (print "init fuzzy rule system");;(setq *fuzzy-set (append *fuzzy-sets (list (make-fuzzy-set))))
               )
              ((eq (car msgl) 'add-fuzzy-set) (setq *fuzzy-sets (append *fuzzy-sets (list (cadr msgl)))))
              (t (print "Fuzzy Rule System : message not understood"))))
    ))


