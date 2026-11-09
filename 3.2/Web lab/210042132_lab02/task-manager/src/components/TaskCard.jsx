import React from "react";

export default function TaskCard({ task, onRemove, onToggle }) {
  return (
    <div
      className="task-item"
      onClick={() => onToggle(task.id)}
      style={{
        border: 1,
        borderColor: "black",
        padding: 2,
        margin: 10,
      }}
    >
      <span
        className="task-title"
        style={{
          textDecoration: task.completed ? "line-through" : "",
          paddingRight: 8,
          fontWeight: 500,
        }}
      >
        {task.title}
      </span>
      <span
        className="task-status"
        style={{
          paddingRight: 8,
          fontWeight: 400,
          fontSize: 14,
          color: "#020202",
        }}
      >
        {task.completed ? "Completed" : "Pending"}
      </span>
      <button
        className="remove-button"
        onClick={(event) => {
          event.stopPropagation();
          onRemove(task.id);
        }}
        style={{
          backgroundColor: "red",
          borderRadius: 8,
          padding: 8,
          border: 0,
        }}
      >
        Remove
      </button>
    </div>
  );
}
