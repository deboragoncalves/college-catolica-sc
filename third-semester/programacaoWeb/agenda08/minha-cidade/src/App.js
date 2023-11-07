import Contato from './components/Contato.js';
import MinhaCidade from './components/MinhaCidade.js'
import { Routes, Route } from "react-router-dom"

function App() {
  return (
    <div className="App">
      <Routes>
        <Route path="/" element={ <MinhaCidade /> } />
        <Route path="contato" element={ <Contato/> } />
      </Routes>
    </div>
  );
}

export default App;
