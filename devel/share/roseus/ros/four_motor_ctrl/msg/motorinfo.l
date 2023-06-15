;; Auto-generated. Do not edit!


(when (boundp 'four_motor_ctrl::motorinfo)
  (if (not (find-package "FOUR_MOTOR_CTRL"))
    (make-package "FOUR_MOTOR_CTRL"))
  (shadow 'motorinfo (find-package "FOUR_MOTOR_CTRL")))
(unless (find-package "FOUR_MOTOR_CTRL::MOTORINFO")
  (make-package "FOUR_MOTOR_CTRL::MOTORINFO"))

(in-package "ROS")
;;//! \htmlinclude motorinfo.msg.html


(defclass four_motor_ctrl::motorinfo
  :super ros::object
  :slots (_T _W _LW _Acc _Pos _KP _KW _mode _pos_joy1 ))

(defmethod four_motor_ctrl::motorinfo
  (:init
   (&key
    ((:T __T) 0.0)
    ((:W __W) 0.0)
    ((:LW __LW) 0.0)
    ((:Acc __Acc) 0.0)
    ((:Pos __Pos) 0.0)
    ((:KP __KP) 0.0)
    ((:KW __KW) 0.0)
    ((:mode __mode) 0)
    ((:pos_joy1 __pos_joy1) 0.0)
    )
   (send-super :init)
   (setq _T (float __T))
   (setq _W (float __W))
   (setq _LW (float __LW))
   (setq _Acc (float __Acc))
   (setq _Pos (float __Pos))
   (setq _KP (float __KP))
   (setq _KW (float __KW))
   (setq _mode (round __mode))
   (setq _pos_joy1 (float __pos_joy1))
   self)
  (:T
   (&optional __T)
   (if __T (setq _T __T)) _T)
  (:W
   (&optional __W)
   (if __W (setq _W __W)) _W)
  (:LW
   (&optional __LW)
   (if __LW (setq _LW __LW)) _LW)
  (:Acc
   (&optional __Acc)
   (if __Acc (setq _Acc __Acc)) _Acc)
  (:Pos
   (&optional __Pos)
   (if __Pos (setq _Pos __Pos)) _Pos)
  (:KP
   (&optional __KP)
   (if __KP (setq _KP __KP)) _KP)
  (:KW
   (&optional __KW)
   (if __KW (setq _KW __KW)) _KW)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:pos_joy1
   (&optional __pos_joy1)
   (if __pos_joy1 (setq _pos_joy1 __pos_joy1)) _pos_joy1)
  (:serialization-length
   ()
   (+
    ;; float32 _T
    4
    ;; float32 _W
    4
    ;; float32 _LW
    4
    ;; float32 _Acc
    4
    ;; float32 _Pos
    4
    ;; float32 _KP
    4
    ;; float32 _KW
    4
    ;; int32 _mode
    4
    ;; float32 _pos_joy1
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _T
       (sys::poke _T (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _W
       (sys::poke _W (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _LW
       (sys::poke _LW (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Acc
       (sys::poke _Acc (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Pos
       (sys::poke _Pos (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _KP
       (sys::poke _KP (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _KW
       (sys::poke _KW (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _mode
       (write-long _mode s)
     ;; float32 _pos_joy1
       (sys::poke _pos_joy1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _T
     (setq _T (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _W
     (setq _W (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _LW
     (setq _LW (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Acc
     (setq _Acc (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Pos
     (setq _Pos (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _KP
     (setq _KP (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _KW
     (setq _KW (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _mode
     (setq _mode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _pos_joy1
     (setq _pos_joy1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get four_motor_ctrl::motorinfo :md5sum-) "e2e51b2487914c67f91427adb33d8627")
(setf (get four_motor_ctrl::motorinfo :datatype-) "four_motor_ctrl/motorinfo")
(setf (get four_motor_ctrl::motorinfo :definition-)
      "float32 T
float32 W
float32 LW
float32 Acc 
float32 Pos
float32 KP
float32 KW
int32 mode
float32 pos_joy1
")



(provide :four_motor_ctrl/motorinfo "e2e51b2487914c67f91427adb33d8627")


