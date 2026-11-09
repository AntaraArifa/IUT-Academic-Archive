import React from "react";
import NavComponent from "./components/NavComponent";
import HeroComponent from "./components/HeroComponent";
import Industries from "./components/Industries";
import EntrepreneursComponent from "./components/EntrepreneursComponent";
import TradersMain from "./components/TradersMain";
import Partners from "./components/Partners";
import FooterComponent from "./components/FooterComponent";

function App() {
  return (
    <div>
      <NavComponent />
      <HeroComponent />
      <Industries />
      <EntrepreneursComponent />
      <TradersMain />
      <Partners />
      <FooterComponent />
    </div>
  );
}

export default App;
