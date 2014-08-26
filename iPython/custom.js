$([IPython.events]).on('app_initialized.NotebookApp', function(){
    IPython.toolbar.add_buttons_group([
            {
                'label'   : 'run qtconsole',
                'icon'    : 'icon-terminal', // select your icon from http://fortawesome.github.io/Font-Awesome/icons
                'callback': function () {
                    IPython.notebook.kernel.execute('%qtconsole');
                }
           },
           //create a gits and nbviewer link for the notebook
           {
                'label'   : 'export gist',
                'icon'    : 'icon-github-alt', // select your icon from http://fortawesome.github.io/Font-Awesome/icons
                'callback': function () {
                    IPython.load_extensions('nbextensions/gist');
                }
           }

           // add more button here if needed.
           ]);

    //Extensions:

     //Table of contents extension
     IPython.load_extensions('nbextensions/toc');
     //Hide all output extension
     IPython.load_extensions('nbextensions/hide_output_all');
     //Hide all input extension
     IPython.load_extensions('nbextensions/hide_input_all');
     //multi copy paste
     // IPython.load_extensions('nb-cccp/copy-paste');

     //multi copy paste
    require(['nbextensions/nb-cccp/copy-paste'], function (copy_paste) {
    copy_paste.load_ipython_extension();
    console.log('copy_paste extension loaded');
    });


     //Keyboard Shortcuts:

     //Add shortcut for switching between markdown while in edit mode
     IPython.keyboard_manager.edit_shortcuts.add_shortcut('ctrl-s', {
        help : 'toggle markdown/code',
        handler : function (event) {
            var cell = IPython.notebook.get_selected_cell();
            if (cell.cell_type == 'code') {
                IPython.notebook.to_markdown();
                IPython.notebook.edit_mode();
            } else if (cell.cell_type == 'markdown') {
                IPython.notebook.to_code();
                IPython.notebook.edit_mode();
            }
            return false;
        }
    });

   });
