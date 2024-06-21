m = '';
jmolinteractor = '';
function loadMSA(msa_file, referenceResidues) {
    var opts = {
        el: document.getElementById("msa"),
        vis: {
            conserv: false,
            overviewbox: false,
            seqlogo: true
        },
        conf: {
            dropImport: true
        },
        zoomer: {
            menuFontsize: "12px",
            autoResize: true,
            residueFont: "8.5",
        }
    };
    m = new msa.msa(opts);
    m.u.file.importURL(msa_file, function() {
        labelReferenceResidues(m, referenceResidues);
        m.render();
    });

    jmolinteractor = new JmolAppletInteractor(jmolApplet0);
}

function difference(a1, a2) {
  var result = [];
  for (var i = 0; i < a1.length; i++) {
    if (a2.indexOf(a1[i]) === -1) {
      result.push(a1[i]);
    }
  }
  return result;
}

function JmolAppletInteractor(applet) {
    this.applet = applet;
    this.highlightedResidues = [];
    this.jmolhighlightedResidues = [];

    this.unhighlightResidue = function (residue) {
        console.log('Removing highlight from residue: ' + residue);
        var index = this.highlightedResidues.indexOf(residue);
        this.highlightedResidues.splice(index, 1);
        this.updateHighlightedResidues();
    }

    this.highlightResidue = function (residue) {
        console.log('Highlighting residue: '+ residue);
        this.highlightedResidues.push(residue);
        this.updateHighlightedResidues();
    }

    this.updateHighlightedResidues = function () {
        var toselect = difference(this.highlightedResidues, this.jmolhighlightedResidues);
        console.log(toselect);
        this.selectResidues(toselect) && this.highlightSelection();
        var unselect = difference(this.jmolhighlightedResidues, this.highlightedResidues);
        console.log(unselect);
        this.selectResidues(unselect) && this.unhighlightSelection();
        this.jmolhighlightedResidues = this.highlightedResidues.slice();
        this.unselectAllResidues();
    }

    this.selectResidues = function (residues) {
        console.log(residues.length)
        if (residues.length != 0){
            Jmol.script(this.applet, 'select ' + residues.join() + ';');
            return true;
        }
        return false;
    }
    this.unselectAllResidues = function () {
        Jmol.script(this.applet, 'select none;');
    }
    this.highlightSelection = function () {
        Jmol.script(this.applet, 'wireframe 0.4 on;');
    }
    this.unhighlightSelection = function () {
        Jmol.script(this.applet, 'wireframe off; cartoon on;');
    }

}

function toggleHighlightState (data) {
    var feature = data.feature;
    var pdbResidue = feature.get('text');
    if (feature.get('highlighted')){
        feature.set('highlighted', false);
        feature.set('fillColor', 'white');
        jmolinteractor.unhighlightResidue(pdbResidue);
    }
    else {
        feature.set('highlighted', true);
        feature.set('fillColor', 'red');
        jmolinteractor.highlightResidue(pdbResidue);
    }
}

function labelReferenceResidues(m, pdbResidues) {
    var Feature = msa.model.feature;
    var reference = m.seqs.findWhere({name: 'refPDBseq'});
    var alignedSequence = reference.attributes.seq.split('');
    var totalLength = alignedSequence.length;
    var features = [];
    var residueCounter = 0;
    for (var alignedIndex = 0; alignedIndex < totalLength; alignedIndex++) {
        if(alignedSequence[alignedIndex] != '-'){
            if(residueCounter < pdbResidues.length) {
                var pdbResidue = pdbResidues[residueCounter];
                var start = alignedIndex;
                var end = alignedIndex;
                /*
                if (pdbResidue > 99) {
                    // Enlarge label, causes the usage of two columns vor numbers
                    start -= 0.5;
                    end += 0.5;
                }
                */
                features.push(new Feature({
                    xStart: start,
                    xEnd: end,
                    text: pdbResidue,
                    fillColor: "white",
                    highlighted: false,
                }));
                residueCounter++;
            }
            else {
                break;
            }
        }
    }

    features = new msa.model.featurecol(features);
    reference.set("features", features);
    reference.attributes.features.assignRows();
    reference.attributes.height = reference.attributes.features.getCurrentHeight() + 1;
    m.g.on("feature:click", function(data){toggleHighlightState(data);});
    m.render();
}
