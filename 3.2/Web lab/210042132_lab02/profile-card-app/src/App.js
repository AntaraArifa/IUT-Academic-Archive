import "./App.css";
import ProfileCard from "./components/ProfileCard";

function App() {
  const profileData = [
    {
      name: "Imtiaz Risat",
      jobTitle: "Software Engineer",
      company: "Dev Solutions",
      bio: "Bio goes here",
      skills: ["React", "Node.js", "Python", "AWS", "MongoDB"],
      imageUrl: "",
    },
    {
      name: "Rifah Ramisa",
      jobTitle: "UX Designer",
      company: "Design Studio Ltd",
      bio: "Bio goes here",
      skills: ["Figma", "React", "Adobe XD", "Framer", "Firebase"],
      imageUrl: "",
    },
    {
      name: "Niaz Rahman",
      jobTitle: "Data Scientist",
      company: "Analytics Pro",
      bio: "Bio goes here",
      skills: ["Python", "Rust", "Machine Learning", "SQL", "Colab"],
      imageUrl: "",
    },
  ];

  return (
    <div
      style={{
        minHeight: "100vh",
        background: "#f3f4f6",
        padding: "2rem 0",
      }}
    >
      <div
        style={{
          maxWidth: 1200,
          margin: "0 auto",
          padding: "0 1rem",
        }}
      >
        <div
          style={{
            display: "grid",
            gridTemplateColumns: "repeat(auto-fit, minmax(320px, 1fr))",
            gap: "1.5rem",
          }}
        >
          {profileData.map((profile, index) => (
            <ProfileCard
              key={index}
              name={profile.name}
              jobTitle={profile.jobTitle}
              company={profile.company}
              bio={profile.bio}
              skills={profile.skills}
              imageUrl={profile.imageUrl}
            />
          ))}
        </div>
      </div>
    </div>
  );
}

export default App;
