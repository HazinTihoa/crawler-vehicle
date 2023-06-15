; Auto-generated. Do not edit!


(cl:in-package basic_ctrl-msg)


;//! \htmlinclude swing.msg.html

(cl:defclass <swing> (roslisp-msg-protocol:ros-message)
  ((speed
    :reader speed
    :initarg :speed
    :type cl:float
    :initform 0.0)
   (angular
    :reader angular
    :initarg :angular
    :type cl:float
    :initform 0.0)
   (underarmF
    :reader underarmF
    :initarg :underarmF
    :type cl:float
    :initform 0.0)
   (underarmB
    :reader underarmB
    :initarg :underarmB
    :type cl:float
    :initform 0.0))
)

(cl:defclass swing (<swing>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <swing>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'swing)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name basic_ctrl-msg:<swing> is deprecated: use basic_ctrl-msg:swing instead.")))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <swing>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader basic_ctrl-msg:speed-val is deprecated.  Use basic_ctrl-msg:speed instead.")
  (speed m))

(cl:ensure-generic-function 'angular-val :lambda-list '(m))
(cl:defmethod angular-val ((m <swing>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader basic_ctrl-msg:angular-val is deprecated.  Use basic_ctrl-msg:angular instead.")
  (angular m))

(cl:ensure-generic-function 'underarmF-val :lambda-list '(m))
(cl:defmethod underarmF-val ((m <swing>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader basic_ctrl-msg:underarmF-val is deprecated.  Use basic_ctrl-msg:underarmF instead.")
  (underarmF m))

(cl:ensure-generic-function 'underarmB-val :lambda-list '(m))
(cl:defmethod underarmB-val ((m <swing>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader basic_ctrl-msg:underarmB-val is deprecated.  Use basic_ctrl-msg:underarmB instead.")
  (underarmB m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <swing>) ostream)
  "Serializes a message object of type '<swing>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angular))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'underarmF))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'underarmB))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <swing>) istream)
  "Deserializes a message object of type '<swing>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angular) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'underarmF) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'underarmB) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<swing>)))
  "Returns string type for a message object of type '<swing>"
  "basic_ctrl/swing")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'swing)))
  "Returns string type for a message object of type 'swing"
  "basic_ctrl/swing")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<swing>)))
  "Returns md5sum for a message object of type '<swing>"
  "f3f06838ecf36bbdb33f3bf9bd242376")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'swing)))
  "Returns md5sum for a message object of type 'swing"
  "f3f06838ecf36bbdb33f3bf9bd242376")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<swing>)))
  "Returns full string definition for message of type '<swing>"
  (cl:format cl:nil "float32 speed~%float32 angular~%float32 underarmF~%float32 underarmB ~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'swing)))
  "Returns full string definition for message of type 'swing"
  (cl:format cl:nil "float32 speed~%float32 angular~%float32 underarmF~%float32 underarmB ~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <swing>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <swing>))
  "Converts a ROS message object to a list"
  (cl:list 'swing
    (cl:cons ':speed (speed msg))
    (cl:cons ':angular (angular msg))
    (cl:cons ':underarmF (underarmF msg))
    (cl:cons ':underarmB (underarmB msg))
))
