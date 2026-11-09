import React from "react";

export default function NavComponent() {
  return (
    <nav
      style={{
        display: "flex",
        justifyContent: "space-between",
        alignItems: "center",
        padding: "20px 48px",
        background: "#222",
        color: "#fff",
        boxShadow: "0 2px 8px rgba(0,0,0,0.08)",
        position: "sticky",
        top: 0,
        zIndex: 1000,
      }}
    >
      <div style={{ fontWeight: "bold", fontSize: 28, letterSpacing: 2 }}>
        Consulting
      </div>
      <div>
        <a
          href="#industries"
          style={{
            color: "#fff",
            margin: "0 20px",
            textDecoration: "none",
            fontSize: 18,
            padding: "6px 0",
            borderBottom: "2px solid transparent",
            transition: "border 0.2s",
          }}
          onMouseOver={(e) => (e.target.style.borderBottom = "2px solid #fff")}
          onMouseOut={(e) =>
            (e.target.style.borderBottom = "2px solid transparent")
          }
        >
          Industries
        </a>
        <a
          href="#traders"
          style={{
            color: "#fff",
            margin: "0 20px",
            textDecoration: "none",
            fontSize: 18,
            padding: "6px 0",
            borderBottom: "2px solid transparent",
            transition: "border 0.2s",
          }}
          onMouseOver={(e) => (e.target.style.borderBottom = "2px solid #fff")}
          onMouseOut={(e) =>
            (e.target.style.borderBottom = "2px solid transparent")
          }
        >
          Traders
        </a>
        <a
          href="#partners"
          style={{
            color: "#fff",
            margin: "0 20px",
            textDecoration: "none",
            fontSize: 18,
            padding: "6px 0",
            borderBottom: "2px solid transparent",
            transition: "border 0.2s",
          }}
          onMouseOver={(e) => (e.target.style.borderBottom = "2px solid #fff")}
          onMouseOut={(e) =>
            (e.target.style.borderBottom = "2px solid transparent")
          }
        >
          Partners
        </a>
      </div>
    </nav>
  );
}
