import React from "react";

const industryList = [
  "Travel and Aviation Consulting",
  "Business Services Consulting",
  "Consumer Products Consulting",
  "Financial Services Consulting",
  "Energy and Environment Consulting",
  "Surface Transport & Logistics Consulting",
];

function Industry({ name }) {
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
        background: "#f9f9f9",
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
        <span>•</span>
      </div>
      <h3 style={{ margin: 0, fontSize: 18, textAlign: "center" }}>{name}</h3>
    </div>
  );
}

export default function Industries() {
  return (
    <section
      id="industries"
      style={{ padding: "56px 0 48px 0", background: "#fff" }}
    >
      <h2
        style={{
          textAlign: "center",
          fontSize: 36,
          marginBottom: 40,
          fontWeight: 800,
          letterSpacing: 1,
        }}
      >
        Industries
      </h2>
      <div
        style={{
          display: "grid",
          gridTemplateColumns: "repeat(auto-fit, minmax(240px, 1fr))",
          gap: 32,
          justifyContent: "center",
          alignItems: "stretch",
          maxWidth: 1100,
          margin: "0 auto",
        }}
      >
        {industryList.map((name, i) => (
          <Industry key={i} name={name} />
        ))}
      </div>
    </section>
  );
}
