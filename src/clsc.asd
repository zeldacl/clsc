;;;; clsc.asd

(asdf:defsystem #:clsc
  :description "Describe clsc here"
  :author "Your Name <your.name@example.com>"
  :license "Specify license here"
  :serial t
  :components (
               (:module framework
                        :components ((:file "package")
                                     (:file "network")))
               (:file "package")
               (:file "clsc"))
  :depends-on (#-asdf3 :uiop :usocket :cl-protobufs :websocket-driver))


