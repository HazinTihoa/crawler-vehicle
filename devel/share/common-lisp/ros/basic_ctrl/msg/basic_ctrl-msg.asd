
(cl:in-package :asdf)

(defsystem "basic_ctrl-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "swing" :depends-on ("_package_swing"))
    (:file "_package_swing" :depends-on ("_package"))
  ))