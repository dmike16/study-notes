import React from 'react';
import logo from './logo.svg';
import './App.css';
import './component/x-search'

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <x-search name="Quarkus"></x-search>
      </header>
    </div>
  );
}

export default App;
