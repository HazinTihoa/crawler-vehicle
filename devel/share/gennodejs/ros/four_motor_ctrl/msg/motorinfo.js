// Auto-generated. Do not edit!

// (in-package four_motor_ctrl.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class motorinfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.T = null;
      this.W = null;
      this.LW = null;
      this.Acc = null;
      this.Pos = null;
      this.KP = null;
      this.KW = null;
      this.mode = null;
      this.pos_joy1 = null;
    }
    else {
      if (initObj.hasOwnProperty('T')) {
        this.T = initObj.T
      }
      else {
        this.T = 0.0;
      }
      if (initObj.hasOwnProperty('W')) {
        this.W = initObj.W
      }
      else {
        this.W = 0.0;
      }
      if (initObj.hasOwnProperty('LW')) {
        this.LW = initObj.LW
      }
      else {
        this.LW = 0.0;
      }
      if (initObj.hasOwnProperty('Acc')) {
        this.Acc = initObj.Acc
      }
      else {
        this.Acc = 0.0;
      }
      if (initObj.hasOwnProperty('Pos')) {
        this.Pos = initObj.Pos
      }
      else {
        this.Pos = 0.0;
      }
      if (initObj.hasOwnProperty('KP')) {
        this.KP = initObj.KP
      }
      else {
        this.KP = 0.0;
      }
      if (initObj.hasOwnProperty('KW')) {
        this.KW = initObj.KW
      }
      else {
        this.KW = 0.0;
      }
      if (initObj.hasOwnProperty('mode')) {
        this.mode = initObj.mode
      }
      else {
        this.mode = 0;
      }
      if (initObj.hasOwnProperty('pos_joy1')) {
        this.pos_joy1 = initObj.pos_joy1
      }
      else {
        this.pos_joy1 = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type motorinfo
    // Serialize message field [T]
    bufferOffset = _serializer.float32(obj.T, buffer, bufferOffset);
    // Serialize message field [W]
    bufferOffset = _serializer.float32(obj.W, buffer, bufferOffset);
    // Serialize message field [LW]
    bufferOffset = _serializer.float32(obj.LW, buffer, bufferOffset);
    // Serialize message field [Acc]
    bufferOffset = _serializer.float32(obj.Acc, buffer, bufferOffset);
    // Serialize message field [Pos]
    bufferOffset = _serializer.float32(obj.Pos, buffer, bufferOffset);
    // Serialize message field [KP]
    bufferOffset = _serializer.float32(obj.KP, buffer, bufferOffset);
    // Serialize message field [KW]
    bufferOffset = _serializer.float32(obj.KW, buffer, bufferOffset);
    // Serialize message field [mode]
    bufferOffset = _serializer.int32(obj.mode, buffer, bufferOffset);
    // Serialize message field [pos_joy1]
    bufferOffset = _serializer.float32(obj.pos_joy1, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type motorinfo
    let len;
    let data = new motorinfo(null);
    // Deserialize message field [T]
    data.T = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [W]
    data.W = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [LW]
    data.LW = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Acc]
    data.Acc = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Pos]
    data.Pos = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [KP]
    data.KP = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [KW]
    data.KW = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [mode]
    data.mode = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [pos_joy1]
    data.pos_joy1 = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 36;
  }

  static datatype() {
    // Returns string type for a message object
    return 'four_motor_ctrl/motorinfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e2e51b2487914c67f91427adb33d8627';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 T
    float32 W
    float32 LW
    float32 Acc 
    float32 Pos
    float32 KP
    float32 KW
    int32 mode
    float32 pos_joy1
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new motorinfo(null);
    if (msg.T !== undefined) {
      resolved.T = msg.T;
    }
    else {
      resolved.T = 0.0
    }

    if (msg.W !== undefined) {
      resolved.W = msg.W;
    }
    else {
      resolved.W = 0.0
    }

    if (msg.LW !== undefined) {
      resolved.LW = msg.LW;
    }
    else {
      resolved.LW = 0.0
    }

    if (msg.Acc !== undefined) {
      resolved.Acc = msg.Acc;
    }
    else {
      resolved.Acc = 0.0
    }

    if (msg.Pos !== undefined) {
      resolved.Pos = msg.Pos;
    }
    else {
      resolved.Pos = 0.0
    }

    if (msg.KP !== undefined) {
      resolved.KP = msg.KP;
    }
    else {
      resolved.KP = 0.0
    }

    if (msg.KW !== undefined) {
      resolved.KW = msg.KW;
    }
    else {
      resolved.KW = 0.0
    }

    if (msg.mode !== undefined) {
      resolved.mode = msg.mode;
    }
    else {
      resolved.mode = 0
    }

    if (msg.pos_joy1 !== undefined) {
      resolved.pos_joy1 = msg.pos_joy1;
    }
    else {
      resolved.pos_joy1 = 0.0
    }

    return resolved;
    }
};

module.exports = motorinfo;
