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

;;FIXME (let ((synaps T))

(defun make-neuron (msg);;FIXME &optional synaps)
	(let ((*input-synapses ())
		(*output-synapses ())
		(*sigmoidf #'(lambda (a) (/ 1 (+ ( exp a) 1))))
		(*learnrate 0.5)
		(*activation 0.3))

	#'(lambda (msg2 synaps);;FIXME &optional synaps)
		(cond ((eq msg2 'add-input-synaps)
			(setq *input-synapses (append *input-synapses (list synaps))))
			((eq msg2 'add-output-synaps)
			(setq *output-synapses (append *output-synapses (list synaps))))
			((eq msg2 'get-input-synapses) *input-synapses)
			((eq msg2 'get-output-synapses) *output-synapses)
			((eq msg2 'get-activation)
                         (let ((a 0))
                           (dolist (is *input-synapses) (setq a (+ a (* *activation (is 'get-weight)))))
                           (setq a (*sigmoidf a))
                           (setq *activation a)))
			((eq msg2 'init) #'(lambda (msg2 &optional synaps) make-neuron))
			(t (print "Neuron : message not understood."))))
	))
;;);;let
