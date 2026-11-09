import React from "react";

const logos = [
  "https://upload.wikimedia.org/wikipedia/commons/4/44/Microsoft_logo.svg",
  "https://upload.wikimedia.org/wikipedia/commons/a/ab/Apple-logo.png",
  "https://upload.wikimedia.org/wikipedia/commons/5/51/IBM_logo.svg",
];

export default function Partners() {
  return (
    <section
      id="partners"
      style={{
        background: "#fff",
        padding: "40px 0 36px 0",
        textAlign: "center",
        borderTop: "1px solid #e0e0e0",
      }}
    >
      <h2
        style={{
          fontSize: 24,
          marginBottom: 24,
          fontWeight: 700,
          color: "#2a2a2a",
        }}
      >
        Our Partners
      </h2>
      <div
        style={{
          display: "flex",
          justifyContent: "center",
          gap: 56,
          alignItems: "center",
          margin: "0 auto",
          maxWidth: 700,
        }}
      >
        {logos.map((src, i) => (
          <img
            key={i}
            src={src}
            alt="Partner Logo"
            style={{
              height: 48,
              objectFit: "contain",
              background: "#fff",
              border: "1px solid #e0e0e0",
              borderRadius: 8,
              padding: 10,
              boxShadow: "0 1px 4px #eee",
            }}
          />
        ))}
      </div>
    </section>
  );
}
