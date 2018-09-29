(uiop:define-package :clsc/lab/dx/sc2/s2client/env)

(in-package :clsc/lab/dx/sc2/s2client/env)

(defclass <SC2Env> ()
  ((:map-name :reader :map-name
              :initarg :map-name
              :initform (error "map-name is null"))
   (:discount :reader :discount
              :initarg :discount
              :initform 1
              :type number)
   (:discount-zero-after-timeout :reader :discount-zero-after-timeout-p
                                 :initarg :discount-zero-after-timeout
                                 :initform nil
                                 :type boolean)))

(defmacro with-run-env (env &body body)
  `(let (done t)
     (unwind-protect
          (prog2
              (start ,env)
              (progn ,@body))
       (clean ,env))))


(defgeneric start (env &key))

(defgeneric clean (env &key))

(defmethod start ((env <SC2ENV>) &key))
