import React from "react";

const traders = [
  { name: "Rich Experience", desc: "Years of expertise in trading." },
  { name: "Risk Dealing Desk", desc: "Professional risk management." },
  { name: "State-of-the-Art", desc: "Modern trading infrastructure." },
];

function Trader({ name, desc }) {
  return (
    <div
      style={{
        display: "flex",
        flexDirection: "column",
        alignItems: "center",
        flex: 1,
        minWidth: 220,
        margin: 18,
        padding: 24,
        background: "rgba(255,255,255,0.95)",
        borderRadius: 16,
        boxShadow: "0 2px 12px #e0e0e0",
        maxWidth: 260,
      }}
    >
      <div
        style={{
          width: 48,
          height: 48,
          borderRadius: "50%",
          background: "#e0e7ef",
          display: "flex",
          alignItems: "center",
          justifyContent: "center",
          marginBottom: 14,
          fontSize: 26,
          color: "#3a4a6b",
          fontWeight: 700,
        }}
      >
        <span>★</span>
      </div>
      <h3 style={{ margin: 0, fontSize: 18, textAlign: "center" }}>{name}</h3>
      <p style={{ margin: "8px 0 0 0", textAlign: "center", color: "#444" }}>
        {desc}
      </p>
    </div>
  );
}

export default function TradersMain() {
  return (
    <section
      id="traders"
      style={{ background: "#f5f8fc", padding: "56px 0 48px 0" }}
    >
      <h2
        style={{
          textAlign: "center",
          fontSize: 32,
          marginBottom: 36,
          fontWeight: 800,
          letterSpacing: 1,
        }}
      >
        Why Traders Choose Us
      </h2>
      <div
        style={{
          display: "grid",
          gridTemplateColumns: "repeat(auto-fit, minmax(240px, 1fr))",
          gap: 32,
          justifyContent: "center",
          alignItems: "stretch",
          maxWidth: 900,
          margin: "0 auto",
        }}
      >
        {traders.map((t, i) => (
          <Trader key={i} {...t} />
        ))}
      </div>
    </section>
  );
}
