
(cl:in-package :asdf)

(defsystem "four_motor_ctrl-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "motorinfo" :depends-on ("_package_motorinfo"))
    (:file "_package_motorinfo" :depends-on ("_package"))
  ))