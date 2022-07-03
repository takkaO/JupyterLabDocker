FROM python:3.8.13-slim

RUN pip install jupyterlab jupyterlab-language-pack-ja-JP 
RUN pip install jupyterlab-nvdashboard jupyterlab_tabnine
RUN pip install opencv-python matplotlib numpy pandas
RUN pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu116

RUN mkdir -p /root/.jupyter/lab/user-settings/@jupyterlab/apputils-extension
RUN echo ' \
{ \n\
    // Theme \n\
    // @jupyterlab/apputils-extension:themes \n\
    // Theme manager settings. \n\
    // ************************************* \n\
    \n\
    // Selected Theme\n\
    // Application-level visual styling theme\n\
    "theme": "JupyterLab Dark"\n\
}' >> /root/.jupyter/lab/user-settings/@jupyterlab/apputils-extension/themes.jupyterlab-settings

RUN mkdir -p /root/.jupyter/lab/user-settings/@jupyterlab/console-extension
RUN echo ' \
{   \n\
    // Code Console \n\
    // @jupyterlab/console-extension:tracker \n\
    // Code Console settings. \n\
    // ************************************* \n\
    \n\
    // Prompt Cell Configuration \n\
    // The configuration for all prompt cells. \n\
    "promptCellConfig": { \n\
        "autoClosingBrackets": true, \n\
        "cursorBlinkRate": 530, \n\
        "fontFamily": null, \n\
        "fontSize": null, \n\
        "lineHeight": null, \n\
        "lineNumbers": false, \n\
        "lineWrap": "off", \n\
        "matchBrackets": true, \n\
        "readOnly": false, \n\
        "insertSpaces": true, \n\
        "tabSize": 4, \n\
        "wordWrapColumn": 80, \n\
        "rulers": [], \n\
        "codeFolding": false, \n\
        "lineWiseCopyCut": true \n\
    } \n\
}' >> /root/.jupyter/lab/user-settings/@jupyterlab/console-extension/tracker.jupyterlab-settings

RUN mkdir -p /root/.jupyter/lab/user-settings/@jupyterlab/fileeditor-extension
RUN echo ' \
{\n\
    // Text Editor\n\
    // @jupyterlab/fileeditor-extension:plugin\n\
    // Text editor settings.\n\
    // ***************************************\n\
\n\
    // Editor Configuration\n\
    // The configuration for all text editors.\n\
    // If `fontFamily`, `fontSize` or `lineHeight` are `null`,\n\
    // values from current theme are used.\n\
    "editorConfig": {\n\
        "autoClosingBrackets": true,\n\
        "codeFolding": false,\n\
        "cursorBlinkRate": 530,\n\
        "fontFamily": null,\n\
        "fontSize": null,\n\
        "insertSpaces": true,\n\
        "lineHeight": null,\n\
        "lineNumbers": true,\n\
        "lineWrap": "on",\n\
        "matchBrackets": true,\n\
        "readOnly": false,\n\
        "tabSize": 4,\n\
        "rulers": [],\n\
        "showTrailingSpace": false,\n\
        "wordWrapColumn": 80\n\
    }\n\
}' >> /root/.jupyter/lab/user-settings/@jupyterlab/fileeditor-extension/plugin.jupyterlab-settings

RUN mkdir -p /root/.jupyter/lab/user-settings/@jupyterlab/notebook-extension
RUN echo ' \
{\n\
    // Notebook\n\
    // @jupyterlab/notebook-extension:tracker\n\
    // Notebook settings.\n\
    // **************************************\n\
\n\
    // Code Cell Configuration\n\
    // The configuration for all code cells.\n\
    "codeCellConfig": {\n\
        "autoClosingBrackets": true,\n\
        "cursorBlinkRate": 530,\n\
        "fontFamily": null,\n\
        "fontSize": null,\n\
        "lineHeight": null,\n\
        "lineNumbers": false,\n\
        "lineWrap": "off",\n\
        "matchBrackets": true,\n\
        "readOnly": false,\n\
        "insertSpaces": true,\n\
        "tabSize": 4,\n\
        "wordWrapColumn": 80,\n\
        "rulers": [],\n\
        "codeFolding": false,\n\
        "lineWiseCopyCut": true,\n\
        "showTrailingSpace": false\n\
    },\n\
\n\
    // Markdown Cell Configuration\n\
    // The configuration for all markdown cells.\n\
    "markdownCellConfig": {\n\
        "autoClosingBrackets": true,\n\
        "cursorBlinkRate": 530,\n\
        "fontFamily": null,\n\
        "fontSize": null,\n\
        "lineHeight": null,\n\
        "lineNumbers": false,\n\
        "lineWrap": "on",\n\
        "matchBrackets": false,\n\
        "readOnly": false,\n\
        "insertSpaces": true,\n\
        "tabSize": 4,\n\
        "wordWrapColumn": 80,\n\
        "rulers": [],\n\
        "codeFolding": false,\n\
        "lineWiseCopyCut": true,\n\
        "showTrailingSpace": false\n\
    },\n\
\n\
    // Raw Cell Configuration\n\
    // The configuration for all raw cells.\n\
    "rawCellConfig": {\n\
        "autoClosingBrackets": true,\n\
        "cursorBlinkRate": 530,\n\
        "fontFamily": null,\n\
        "fontSize": null,\n\
        "lineHeight": null,\n\
        "lineNumbers": false,\n\
        "lineWrap": "on",\n\
        "matchBrackets": false,\n\
        "readOnly": false,\n\
        "insertSpaces": true,\n\
        "tabSize": 4,\n\
        "wordWrapColumn": 80,\n\
        "rulers": [],\n\
        "codeFolding": false,\n\
        "lineWiseCopyCut": true,\n\
        "showTrailingSpace": false\n\
    }\n\
}' >> /root/.jupyter/lab/user-settings/@jupyterlab/notebook-extension/tracker.jupyterlab-settings

RUN mkdir -p /root/.jupyter/lab/user-settings/@jupyterlab/translation-extension
RUN echo ' \
{\n\
    // Language\n\
    // @jupyterlab/translation-extension:plugin\n\
    // Language settings.\n\
    // ****************************************\n\
    \n\
    // Language locale\n\
    // Set the interface display language. Examples: "es_CO", "fr".\n\
    "locale": "ja_JP"\n\
}' >> /root/.jupyter/lab/user-settings/@jupyterlab/translation-extension/plugin.jupyterlab-settings

CMD [ "jupyter-lab","--notebook-dir=/home/src","--no-browser","--port=8888","--ip=0.0.0.0","--allow-root","--NotebookApp.token=''"]