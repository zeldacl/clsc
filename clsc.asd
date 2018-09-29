#-asdf3.1 (error "CLSC requires ASDF 3.1 or later. Please upgrade your ASDF.")
;;;; clsc.asd

;; (when (asdf:find-system :ql nil))
(let ((third-path #P"thirdparty/"))
  (when (not (find third-path ql:*local-project-directories* :test #'pathname-match-p))
    (setf ql:*local-project-directories* (cons third-path ql:*local-project-directories*))))

(asdf:defsystem #:clsc
  :description "clsc"
  :author "zeldacl <zeldacl@gmail.com>"
  :license "Specify license here"
  :version (:read-file-form "version.text")
  ;; :pathname "src/"
  :components
  ((:module "s2-proto"
            :serial t
            :pathname "protocol/sc2/"
            ;; :search-path "proto"
            :components
            (
             ;; (:protobuf-file "s2clientprotocol/common")
             ;; (:protobuf-file "s2clientprotocol/debug" search-path (#p"protocol/sc2/"))
             (:protobuf-file "s2clientprotocol/sc2api" :search-path (#p""))
             )))
  ;; :protobuf-file "proto"
  :class :package-inferred-system
  ;; :serial t
  ;; :components (
  ;;              (:module framework
  ;;                       :components ((:file "package")
  ;;                                    (:file "network")))
  ;;              (:file "package")
  ;;              (:file "clsc"))
  :defsystem-depends-on ((:version :cl-protobufs "1.0"))
  :depends-on ("clsc/lab/dx/sc2/s2client/core"
               :uiop
               :usocket
               :cl-protobufs
               :websocket-driver
               :log4cl
               :bordeaux-threads
               (:version :local-time "1.0.6")
               :unix-opts))


