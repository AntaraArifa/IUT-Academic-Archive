import React from "react";

export default function HeroComponent() {
  return (
    <div
      style={{
        position: "relative",
        minHeight: "380px",
        display: "flex",
        alignItems: "center",
        justifyContent: "center",
        backgroundImage:
          "linear-gradient(rgba(0,0,0,0.6),rgba(0,0,0,0.6)), url('https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?auto=format&fit=crop&w=1200&q=80')",
        backgroundSize: "cover",
        backgroundPosition: "center",
        color: "#fff",
        textAlign: "center",
        padding: "80px 0 60px 0",
      }}
    >
      <div>
        <h1
          style={{
            fontSize: 54,
            margin: 0,
            letterSpacing: 2,
            fontWeight: 800,
            textShadow: "0 2px 8px #000",
          }}
        >
          VIDEO SLIDER
        </h1>
        <p
          style={{
            fontSize: 22,
            marginTop: 18,
            fontWeight: 500,
            textShadow: "0 1px 4px #000",
          }}
        >
          Consulting & Business Solutions
        </p>
      </div>
    </div>
  );
}
