; Auto-generated. Do not edit!


(cl:in-package four_motor_ctrl-msg)


;//! \htmlinclude motorinfo.msg.html

(cl:defclass <motorinfo> (roslisp-msg-protocol:ros-message)
  ((T
    :reader T
    :initarg :T
    :type cl:float
    :initform 0.0)
   (W
    :reader W
    :initarg :W
    :type cl:float
    :initform 0.0)
   (LW
    :reader LW
    :initarg :LW
    :type cl:float
    :initform 0.0)
   (Acc
    :reader Acc
    :initarg :Acc
    :type cl:float
    :initform 0.0)
   (Pos
    :reader Pos
    :initarg :Pos
    :type cl:float
    :initform 0.0)
   (KP
    :reader KP
    :initarg :KP
    :type cl:float
    :initform 0.0)
   (KW
    :reader KW
    :initarg :KW
    :type cl:float
    :initform 0.0)
   (mode
    :reader mode
    :initarg :mode
    :type cl:integer
    :initform 0)
   (pos_joy1
    :reader pos_joy1
    :initarg :pos_joy1
    :type cl:float
    :initform 0.0))
)

(cl:defclass motorinfo (<motorinfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <motorinfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'motorinfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name four_motor_ctrl-msg:<motorinfo> is deprecated: use four_motor_ctrl-msg:motorinfo instead.")))

(cl:ensure-generic-function 'T-val :lambda-list '(m))
(cl:defmethod T-val ((m <motorinfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader four_motor_ctrl-msg:T-val is deprecated.  Use four_motor_ctrl-msg:T instead.")
  (T m))

(cl:ensure-generic-function 'W-val :lambda-list '(m))
(cl:defmethod W-val ((m <motorinfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader four_motor_ctrl-msg:W-val is deprecated.  Use four_motor_ctrl-msg:W instead.")
  (W m))

(cl:ensure-generic-function 'LW-val :lambda-list '(m))
(cl:defmethod LW-val ((m <motorinfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader four_motor_ctrl-msg:LW-val is deprecated.  Use four_motor_ctrl-msg:LW instead.")
  (LW m))

(cl:ensure-generic-function 'Acc-val :lambda-list '(m))
(cl:defmethod Acc-val ((m <motorinfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader four_motor_ctrl-msg:Acc-val is deprecated.  Use four_motor_ctrl-msg:Acc instead.")
  (Acc m))

(cl:ensure-generic-function 'Pos-val :lambda-list '(m))
(cl:defmethod Pos-val ((m <motorinfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader four_motor_ctrl-msg:Pos-val is deprecated.  Use four_motor_ctrl-msg:Pos instead.")
  (Pos m))

(cl:ensure-generic-function 'KP-val :lambda-list '(m))
(cl:defmethod KP-val ((m <motorinfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader four_motor_ctrl-msg:KP-val is deprecated.  Use four_motor_ctrl-msg:KP instead.")
  (KP m))

(cl:ensure-generic-function 'KW-val :lambda-list '(m))
(cl:defmethod KW-val ((m <motorinfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader four_motor_ctrl-msg:KW-val is deprecated.  Use four_motor_ctrl-msg:KW instead.")
  (KW m))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <motorinfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader four_motor_ctrl-msg:mode-val is deprecated.  Use four_motor_ctrl-msg:mode instead.")
  (mode m))

(cl:ensure-generic-function 'pos_joy1-val :lambda-list '(m))
(cl:defmethod pos_joy1-val ((m <motorinfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader four_motor_ctrl-msg:pos_joy1-val is deprecated.  Use four_motor_ctrl-msg:pos_joy1 instead.")
  (pos_joy1 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <motorinfo>) ostream)
  "Serializes a message object of type '<motorinfo>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'T))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'W))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'LW))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Acc))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Pos))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'KP))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'KW))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'mode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pos_joy1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <motorinfo>) istream)
  "Deserializes a message object of type '<motorinfo>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'T) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'W) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'LW) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Acc) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Pos) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'KP) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'KW) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pos_joy1) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<motorinfo>)))
  "Returns string type for a message object of type '<motorinfo>"
  "four_motor_ctrl/motorinfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'motorinfo)))
  "Returns string type for a message object of type 'motorinfo"
  "four_motor_ctrl/motorinfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<motorinfo>)))
  "Returns md5sum for a message object of type '<motorinfo>"
  "e2e51b2487914c67f91427adb33d8627")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'motorinfo)))
  "Returns md5sum for a message object of type 'motorinfo"
  "e2e51b2487914c67f91427adb33d8627")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<motorinfo>)))
  "Returns full string definition for message of type '<motorinfo>"
  (cl:format cl:nil "float32 T~%float32 W~%float32 LW~%float32 Acc ~%float32 Pos~%float32 KP~%float32 KW~%int32 mode~%float32 pos_joy1~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'motorinfo)))
  "Returns full string definition for message of type 'motorinfo"
  (cl:format cl:nil "float32 T~%float32 W~%float32 LW~%float32 Acc ~%float32 Pos~%float32 KP~%float32 KW~%int32 mode~%float32 pos_joy1~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <motorinfo>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <motorinfo>))
  "Converts a ROS message object to a list"
  (cl:list 'motorinfo
    (cl:cons ':T (T msg))
    (cl:cons ':W (W msg))
    (cl:cons ':LW (LW msg))
    (cl:cons ':Acc (Acc msg))
    (cl:cons ':Pos (Pos msg))
    (cl:cons ':KP (KP msg))
    (cl:cons ':KW (KW msg))
    (cl:cons ':mode (mode msg))
    (cl:cons ':pos_joy1 (pos_joy1 msg))
))
