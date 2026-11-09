import React, { useState } from "react";
import TaskCard from "./TaskCard";

export default function TaskManager() {
  const [tasks, setTasks] = useState([
    { id: 1, title: "Learn React basics", completed: false },
    { id: 2, title: "Practice useState hook", completed: true },
    { id: 3, title: "Build first React app", completed: false },
  ]);

  const totalTasks = tasks.length;
  const totalCompleted = tasks.filter((task) => task.completed === true).length;
  const totalRemaining = tasks.filter(
    (task) => task.completed === false
  ).length;

  const removeTask = (id) => {
    setTasks(tasks.filter((task) => task.id !== id));
  };

  const addTask = () => {
    setTasks([
      ...tasks,
      {
        id:
          tasks.length > 0 ? Math.max(...tasks.map((task) => task.id)) + 1 : 1,
        title: "Random Task",
        completed: false,
      },
    ]);
  };

  const clearCompleted = () => {
    setTasks(tasks.filter((task) => task.completed !== true));
  };

  const toggleStatus = (id) => {
    setTasks(
      tasks.map((task) =>
        task.id === id ? { ...task, completed: !task.completed } : task
      )
    );
  };

  return (
    <div className="container">
      <h1>Interactive Task Manager</h1>
      <p>Click tasks to toggle, add new tasks, manage to-do list.</p>
      <div className="task-summary">
        <div className="count-item">
          <span>{totalTasks}</span>
          <span>Total tasks</span>
        </div>
        <div className="count-item">
          <span>{totalCompleted}</span>
          <span>Completed</span>
        </div>
        <div className="count-item">
          <span>{totalRemaining}</span>
          <span>Remaining</span>
        </div>
      </div>
      <div className="actions" style={{ marginTop: 14 }}>
        <button
          onClick={addTask}
          style={{
            backgroundColor: "orange",
            borderRadius: 8,
            padding: 8,
            border: 0,
            marginRight: 12,
          }}
        >
          Add Random
        </button>
        <button
          onClick={clearCompleted}
          style={{
            backgroundColor: "red",
            borderRadius: 8,
            padding: 8,
            border: 0,
          }}
        >
          Clear Completed (if available)
        </button>
      </div>

      {tasks.map((task, index) => (
        <TaskCard
          key={index}
          task={task}
          onToggle={toggleStatus}
          onRemove={removeTask}
        ></TaskCard>
      ))}
    </div>
  );
}
