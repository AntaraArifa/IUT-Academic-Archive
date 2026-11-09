export default function ProfileCard({
  name,
  jobTitle,
  company,
  bio,
  skills = [],
  imageUrl,
}) {
  const handleContactClick = () => {
    console.log(`Contact button clicked for ${name}`);
  };

  return (
    <div
      style={{
        maxWidth: "24rem",
        margin: "1rem auto",
        background: "#fff",
        borderRadius: "1rem",
        boxShadow: "0 4px 24px rgba(0,0,0,0.10)",
        overflow: "hidden",
        transition: "box-shadow 0.3s",
      }}
    >
      {/* Profile Image */}
      <div
        style={{
          display: "flex",
          justifyContent: "center",
          paddingTop: "1.5rem",
        }}
      >
        <img
          src={imageUrl}
          alt={`${name}'s profile`}
          style={{
            width: "6rem",
            height: "6rem",
            borderRadius: "50%",
            objectFit: "cover",
            border: "4px solid #f3f4f6",
          }}
        />
      </div>

      {/* Profile Content */}
      <div style={{ padding: "1.5rem" }}>
        {/* Name */}
        <h2
          style={{
            fontSize: "1.5rem",
            fontWeight: "bold",
            color: "#1f2937",
            textAlign: "center",
            marginBottom: "0.5rem",
          }}
        >
          {name}
        </h2>

        {/* Job Title */}
        <p
          style={{
            fontSize: "1.125rem",
            color: "#2563eb",
            textAlign: "center",
            fontWeight: 600,
            marginBottom: "0.25rem",
          }}
        >
          {jobTitle}
        </p>

        {/* Company */}
        <p
          style={{
            color: "#4b5563",
            textAlign: "center",
            marginBottom: "1rem",
          }}
        >
          {company}
        </p>

        {/* Bio */}
        <p
          style={{
            color: "#374151",
            fontSize: "0.95rem",
            lineHeight: 1.6,
            marginBottom: "1rem",
          }}
        >
          {bio}
        </p>

        {/* Skills */}
        <div style={{ marginBottom: "1.5rem" }}>
          <h3
            style={{
              fontSize: "0.95rem",
              fontWeight: 600,
              color: "#1f2937",
              marginBottom: "0.5rem",
            }}
          >
            Skills
          </h3>
          <div style={{ display: "flex", flexWrap: "wrap", gap: "0.5rem" }}>
            {skills.map((skill, index) => (
              <span
                key={index}
                style={{
                  padding: "0.25rem 0.75rem",
                  background: "#dbeafe",
                  color: "#1e40af",
                  fontSize: "0.8rem",
                  borderRadius: "9999px",
                  fontWeight: 500,
                }}
              >
                {skill}
              </span>
            ))}
          </div>
        </div>

        {/* Contact Button */}
        <button
          onClick={handleContactClick}
          style={{
            width: "100%",
            background: "#2563eb",
            color: "#fff",
            fontWeight: 600,
            padding: "0.5rem 1rem",
            borderRadius: "0.75rem",
            border: "none",
            cursor: "pointer",
            transition: "background 0.2s",
            outline: "none",
          }}
          onMouseOver={(e) => (e.target.style.background = "#1d4ed8")}
          onMouseOut={(e) => (e.target.style.background = "#2563eb")}
        >
          Contact
        </button>
      </div>
    </div>
  );
}
