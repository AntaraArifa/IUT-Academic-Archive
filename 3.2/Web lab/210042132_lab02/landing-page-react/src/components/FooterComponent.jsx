import React from "react";

export default function FooterComponent() {
  return (
    <footer
      style={{
        background: "#222",
        color: "#fff",
        padding: "28px 0 20px 0",
        textAlign: "center",
        marginTop: 32,
        borderTop: "2px solid #e0e0e0",
      }}
    >
      <div>
        Consulting &copy; {new Date().getFullYear()} | All rights reserved.
      </div>
    </footer>
  );
}
