import React from 'react';
import ReactDOM from 'react-dom';

export class XSearch extends HTMLElement {
  mountPoint;
  
  connectedCallback() {
    this.mountPoint = document.createElement('span');
    this.attachShadow({ mode: 'open' }).appendChild(this.mountPoint);

    const name = this.getAttribute('name');
    const url = 'https://www.google.com/search?q=' + encodeURIComponent(name);
    ReactDOM.render(<a href={url}>{name}</a>, this.mountPoint);
  }

  disconnectedCallback() {
    ReactDOM.unmountComponentAtNode(this.mountPoint);
  }
}

customElements.define('x-search', XSearch);