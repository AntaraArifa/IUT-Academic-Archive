import mongoose from "mongoose";
const { Schema } = mongoose;

const User = new Schema({
  name: { type: String, required: true },
  email: { type: String, required: true, unique: true },
  password: { type: String, required: true },
  department: { type: String, required: true, enum: ["CSE", "EEE"] },
});

const UserModel = mongoose.model("User", User);
export default UserModel;
