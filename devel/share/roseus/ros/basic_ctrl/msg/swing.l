;; Auto-generated. Do not edit!


(when (boundp 'basic_ctrl::swing)
  (if (not (find-package "BASIC_CTRL"))
    (make-package "BASIC_CTRL"))
  (shadow 'swing (find-package "BASIC_CTRL")))
(unless (find-package "BASIC_CTRL::SWING")
  (make-package "BASIC_CTRL::SWING"))

(in-package "ROS")
;;//! \htmlinclude swing.msg.html


(defclass basic_ctrl::swing
  :super ros::object
  :slots (_speed _angular _underarmF _underarmB ))

(defmethod basic_ctrl::swing
  (:init
   (&key
    ((:speed __speed) 0.0)
    ((:angular __angular) 0.0)
    ((:underarmF __underarmF) 0.0)
    ((:underarmB __underarmB) 0.0)
    )
   (send-super :init)
   (setq _speed (float __speed))
   (setq _angular (float __angular))
   (setq _underarmF (float __underarmF))
   (setq _underarmB (float __underarmB))
   self)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:angular
   (&optional __angular)
   (if __angular (setq _angular __angular)) _angular)
  (:underarmF
   (&optional __underarmF)
   (if __underarmF (setq _underarmF __underarmF)) _underarmF)
  (:underarmB
   (&optional __underarmB)
   (if __underarmB (setq _underarmB __underarmB)) _underarmB)
  (:serialization-length
   ()
   (+
    ;; float32 _speed
    4
    ;; float32 _angular
    4
    ;; float32 _underarmF
    4
    ;; float32 _underarmB
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angular
       (sys::poke _angular (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _underarmF
       (sys::poke _underarmF (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _underarmB
       (sys::poke _underarmB (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _speed
     (setq _speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angular
     (setq _angular (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _underarmF
     (setq _underarmF (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _underarmB
     (setq _underarmB (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get basic_ctrl::swing :md5sum-) "f3f06838ecf36bbdb33f3bf9bd242376")
(setf (get basic_ctrl::swing :datatype-) "basic_ctrl/swing")
(setf (get basic_ctrl::swing :definition-)
      "float32 speed
float32 angular
float32 underarmF
float32 underarmB 
")



(provide :basic_ctrl/swing "f3f06838ecf36bbdb33f3bf9bd242376")


