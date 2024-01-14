// InitModule
function InitModule() {
}

// ShutdownModule
function ShutdownModule() {
}

function setup() { }

let speech;
let cont = false;
let interim = false;


function getSpeech(id, string) {
    let txt = speech.resultString;
    console.log(txt);

    if (txt.includes(string)) {
        CL.Open.Slide({ slideid: id });
    } else {
        alert('anda salah, yang benar: ' + string);
    }
}

function microphoneOn(micOn, micOff, slideid, string) {
    CLO[micOn].Show();
    CLO[micOff].Hide();

    speech = new p5.SpeechRec('id-ID');
    speech.start(cont, interim);
    speech.onEnd = () => {
        microphoneOff(micOn, micOff);
    };

    speech.onResult = () => {
        getSpeech(slideid, string);
    };
}

function microphoneOff(micOn, micOff) {
    CLO[micOn].Hide();
    CLO[micOff].Show();

    speech = new p5.SpeechRec('id-ID');
    speech.start(false, false);
}
