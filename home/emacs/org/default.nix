{ config, pkgs, lib, ... }:
with lib;
with pkgs;
{
  programs.emacs.init.usePackage = {
    org-mode = {
      enable = true;
      package = "org";
      mode = [ ''"\\.org\\'"'' ];
      extraConfig = ''
        :custom
        (org-startup-indented t)
        (org-startup-folded nil)
        (org-indent-indentation-per-level 1)
        (org-hide-emphasis-markers t)
        (org-pretty-entities t)
        (org-fontify-quote-and-verse-blocks t)
        (org-directory "~/Org")
        (org-default-notes-file "~/Org/notes.org")
        (org-todo-keywords
          '((sequence "TODO(t)" 
                      "STRT(s)"
                      "WAIT(w)"
                      "HOLD(h)"
                      "|"
                      "DONE(d)"
                      "KILL(k)")))
        (org-todo-keyword-faces
          '(("TODO" . org-todo)
	          ("STRT" . org-todo)
	          ("WAIT" . warning)
	          ("HOLD" . warning)))
        (org-capture-templates 
          '(("t" "Task" entry (file+headline org-default-notes-file "Tasks")
             "* TODO %?\n Entered at %U\n %i\n")
            ("n" "Note" entry (file+headline org-default-notes-file "Notes")
             "* %?\n Entered at %U\n %i\n")))
      '';
    };

    org-bullets = {
      enable = true;
      hook = [ "(org-mode . org-bullets-mode)" ];
      extraConfig = ''
        :custom
        (org-bullets-bullet-list '("✿" "◉" "✸" "○"))
      '';
    };
    

    smartparens.hook = [ "(org-mode . smartparens-mode)" ];
  };
}
