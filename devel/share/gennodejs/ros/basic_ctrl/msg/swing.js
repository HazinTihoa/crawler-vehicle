// Auto-generated. Do not edit!

// (in-package basic_ctrl.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class swing {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.speed = null;
      this.angular = null;
      this.underarmF = null;
      this.underarmB = null;
    }
    else {
      if (initObj.hasOwnProperty('speed')) {
        this.speed = initObj.speed
      }
      else {
        this.speed = 0.0;
      }
      if (initObj.hasOwnProperty('angular')) {
        this.angular = initObj.angular
      }
      else {
        this.angular = 0.0;
      }
      if (initObj.hasOwnProperty('underarmF')) {
        this.underarmF = initObj.underarmF
      }
      else {
        this.underarmF = 0.0;
      }
      if (initObj.hasOwnProperty('underarmB')) {
        this.underarmB = initObj.underarmB
      }
      else {
        this.underarmB = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type swing
    // Serialize message field [speed]
    bufferOffset = _serializer.float32(obj.speed, buffer, bufferOffset);
    // Serialize message field [angular]
    bufferOffset = _serializer.float32(obj.angular, buffer, bufferOffset);
    // Serialize message field [underarmF]
    bufferOffset = _serializer.float32(obj.underarmF, buffer, bufferOffset);
    // Serialize message field [underarmB]
    bufferOffset = _serializer.float32(obj.underarmB, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type swing
    let len;
    let data = new swing(null);
    // Deserialize message field [speed]
    data.speed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [angular]
    data.angular = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [underarmF]
    data.underarmF = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [underarmB]
    data.underarmB = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'basic_ctrl/swing';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f3f06838ecf36bbdb33f3bf9bd242376';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 speed
    float32 angular
    float32 underarmF
    float32 underarmB 
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new swing(null);
    if (msg.speed !== undefined) {
      resolved.speed = msg.speed;
    }
    else {
      resolved.speed = 0.0
    }

    if (msg.angular !== undefined) {
      resolved.angular = msg.angular;
    }
    else {
      resolved.angular = 0.0
    }

    if (msg.underarmF !== undefined) {
      resolved.underarmF = msg.underarmF;
    }
    else {
      resolved.underarmF = 0.0
    }

    if (msg.underarmB !== undefined) {
      resolved.underarmB = msg.underarmB;
    }
    else {
      resolved.underarmB = 0.0
    }

    return resolved;
    }
};

module.exports = swing;
