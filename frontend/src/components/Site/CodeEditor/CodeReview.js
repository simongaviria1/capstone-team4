import React from "react";
import {Link} from "react-router-dom";
import AceDiff from "ace-diff";
import "../../../CSS/AceEditor.css";
import "../../../CSS/EditorPages.css";
import code from './SeedCode'


var disqus_config = function() {
    this.page.url = "https://test.tyrodev.com/issues";
    this.page.identifier = window.location.pathname;
}

class AceEditor extends React.Component {
  constructor() {
    super();
    this.state = {
      files: [code[0], code[1], code[2]],
      renderDescription: true,
      currentFile: 0
    }
    this.aceDiffer = undefined;
  }

  componentDidMount() {
    const { rightEditor } = this.state

    // This object creates the split editor and imports it in the element with className ".acediff"
    var aceDiffer = this.aceDiffer = new AceDiff({
      mode: null,
      theme: null,
      element: ".acediff",
      diffGranularity: 'broad',
      showDiffs: true,
      showConnectors: true,
      maxDiffs: 5000,
      left: {
        content: this.state.files[this.state.currentFile].code,
        mode: 'null',
        theme: null,
        editable: false,
        copyLinkEnabled: true,
      },
      right: {
        content: this.state.files[this.state.currentFile].code,
        mode: null,
        theme: null,
        editable: true,
        copyLinkEnabled: true,
      },
      classes: {
        diff: 'acediff__diffLine',
        connector: 'acediff__connector',
        newCodeConnectorLinkContent: '&#8594;',
        deletedCodeConnectorLinkContent: '&#8592;',
      },
    });

    // This function tracks the changes made to the right side of the editor and updates the state
    aceDiffer.getEditors().right.on("change", () => {
      this.setState({
        rightEditor: aceDiffer.getEditors().right.getValue()
      })
    })

    let x = {}
    code.forEach(v => x[v.name] = v.code)
    console.log('X', x)

  }

  renderDescription = () => (
    <div>
      <div>
        <h3>Description</h3>
        <p>Lorem ipsum dolor amet mixtape coloring book subway tile roof party yr adaptogen fingerstache,
        paleo bitters beard. Knausgaard bitters try-hard leggings,
        lumbersexual kogi +1 meggings pinterest pour-over fixie waistcoat truffaut distillery tacos.
        Ennui pop-up hell of, mustache skateboard vaporware tattooed chillwave actually etsy.
        Intelligentsia godard williamsburg quinoa.</p>
      </div>
      <div>
        <h3>Response</h3>
        <p>Lorem ipsum dolor amet mixtape coloring book subway tile roof party yr adaptogen fingerstache,
        paleo bitters beard. Knausgaard bitters try-hard leggings,
        lumbersexual kogi +1 meggings pinterest pour-over fixie waistcoat truffaut distillery tacos.
        Ennui pop-up hell of, mustache skateboard vaporware tattooed chillwave actually etsy.
        Intelligentsia godard williamsburg quinoa.</p>
      </div>
    </div>
  )

  renderComments = () => {
    (function() {
	    let s = document.createElement("script");
	    s.src = "https://tyrodev.disqus.com/embed.js";
	    s.setAttribute("data-timestamp", +new Date());
	    (document.head || document.body).appendChild(s);
    })();

    return <div id="disqus_thread"></div>
  }

  togglePane = e => {
    e.target.innerText === "Description" ?
      this.setState({ renderDescription: true }) :
      this.setState({ renderDescription: false })
  }

  handleTabClick = e => {
	let { left, right } = this.aceDiffer.getEditors();
	  left.setValue(this.state.files[Number(e.target.id)].code);
	  right.setValue(this.state.files[Number(e.target.id)].code);
	  this.setState( { currentFile: Number(e.target.id) } );
 }

  render() {
    const { rightEditor } = this.state
    return (
      <div id="solution">
        <div id="file-tabs">
          {this.state.files.map((v,idx) => <div className="tab" id={idx} onClick={this.handleTabClick}>{v.name}</div>)}
        </div>
        <div id="editor-container">
          <div className="solution-header">
            <h2>Why doesn{"'"}t my for loop work?</h2>
            <Link  to="/issues/:issuesID/solution/new" id="submit-solution-button"><button>Submit Solution</button></Link>
          </div>
    	    <div className="acediff"></div>
        </div>
        <div id="right-pane">
          <div id="pane-nav">
            <p onClick={this.togglePane}>Description</p>
            <p onClick={this.togglePane}>Comments</p>
          </div>
          <div className="pane-section">
            <div className={this.state.renderDescription? "": "hidden"}>{this.renderDescription()}</div>
            <div className={this.state.renderDescription? "hidden": "fullWidth"}>{this.renderComments()}</div>
          </div>
        </div>
      </div>
    )
  }
}

export default AceEditor;
