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

(load "neuron.lisp")
(load "synaps.lisp")
(let ((*input-layer ())
      (*hidden-layer ())
      (*output-layer ()))

  (defun make-net (msg &optional in hn on)

    (cond ((eq msg 'add-input)
           (setq *input-layer (append *input-layer (make-neuron))))
          ((eq msg 'add-hidden)
           (setq *hidden-layer (append *hidden-layer (make-neuron))))
          ((eq msg 'add-output)
           i
           (setq *output-layer (append *output-layer (make-neuron))))
          ((eq msg 'generate-neurons)
           (do ((i 0 (+ i 1)))
               ((>= i in)T)
             i
             (setq *input-layer (append *input-layer (list (make-neuron 'init)))))
           (do ((h 0 (+ h 1)))
               ((>= h hn)T)
             i
             (setq *hidden-layer (append *hidden-layer (list (make-neuron 'init)))))
           (do ((o 0 (+ o 1)))
               ((>= o on)T)
             i			(setq *output-layer (append *output-layer (list (make-neuron 'init)))))

           ;;	(list *input-layer *hidden-layer *output-layer)
           ;;)
           ;;	((eq msg 'connect-synapses)
           (let ((il ())
                 (hl ())
                 (ol ())
                 )
             ;;(print "neurons>")(print (list *input-layer *hidden-layer *output-layer))
             (setq il
                   (mapcar #'(lambda (n)
                               (let ((syn T))
                                 ;; synaps gets pulled through
                                 ;;(setq hl
                                 (mapcar #'(lambda (n2)
                                             (let* ((synaps (make-synaps 'foo))
                                                    )
                                               (setq syn synaps)
                                               (funcall n2 'add-input-synaps synaps)
                                               (funcall synaps 'add-output-neuron n2)
                                               )
                                             (funcall syn 'add-input-neuron n)

                                             )
                                         *hidden-layer)

                                 (funcall n 'add-output-synaps syn)
                                 )
                               )
                           *input-layer)
                   )
             (setq *input-layer il)
             ;;(setq *hidden-layer hl)

             ;;(print "synaps>")(print (funcall (car *hidden-layer)  'get-input-synapses NIL))
             (setq hl (mapcar #'(lambda (n)
                                  (let ((syn T))
                                    ;; synaps gets pulled through
                                    (mapcar #'(lambda (n2)
                                                (let* ((synaps (make-synaps 'foo))
                                                       )
                                                  (setq syn synaps)
                                                  (funcall n2 'add-input-synaps synaps)
                                                  ;;(funcall synaps 'add-output-neuron n2)
                                                  )
                                                ;;(funcall syn 'add-input-neuron n)
                                                )
                                            *output-layer)

                                    (funcall n 'add-output-synaps syn)
                                    ))
                              *hidden-layer)
                   )
             ;;NOTE
             ;;(setq *input-layer il)
             (setq *hidden-layer hl)
             ;;(setq *output-layer ol)
             ;;(print "synapses>")(print (list *input-layer *hidden-layer *output-layer))
             (list *input-layer *hidden-layer *output-layer))
           )
          ((eq msg 'print!)
           (print "print!>")(print *output-layer))
          ((eq msg 'run)
           (dolist (l *inputlayer) (print (l 'get-activation)))
           )
          (T (print "Net : message not understood")))
    ))
