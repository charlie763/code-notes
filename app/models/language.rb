class Language < ApplicationRecord
  POSSIBLE_NAMES = ["A.NET", "A-0 System", "A+", "ABAP", "ABC", "ABC ALGOL", "ACC", "Accent", "Ace DASL (Distributed Application Specification Language)", "Action!", "ActionScript", "Actor", "Ada", "Adenine", "Agda", "Agilent VEE", "Agora", "AIMMS", "Aldor", "Alef", "ALF", "ALGOL 58", "ALGOL 60", "ALGOL 68", "ALGOL W", "Alice", "Alma-0", "AmbientTalk", "Amiga E", "AMOS", "AMPL", "AngelScript", "Apex", "APL", "App Inventor for Android's visual block language", "AppleScript", "APT", "Arc", "ARexx", "Argus", "Assembly language", "AutoHotkey", "AutoIt", "AutoLISP / Visual LISP", "Averest", "AWK", "Axum", "edit", "B", "Babbage", "Ballerina", "Bash", "BASIC", "Batch file (Windows/MS-DOS)", "bc", "BCPL", "BeanShell", "Bertrand", "BETA", "BLISS", "Blockly", "BlooP", "Boo", "Boomerang", "Bosque", "edit", "C", "C--", "C++", "C*", "C#", "C/AL", "Caché ObjectScript", "C Shell (csh)", "Caml", "Cayenne", "CDuce", "Cecil", "Cesil", "Céu", "Ceylon", "CFEngine", "Cg", "Ch", "Chicken", "Chapel", "Charm", "CHILL", "CHIP-8", "chomski", "ChucK", "Cilk", "Citrine", "CL", "Claire", "Clarion", "Clean", "Clipper", "CLIPS", "CLIST", "Clojure", "CLU", "CMS-2", "COBOL", "CobolScript", "Cobra", "CoffeeScript", "ColdFusion", "COMAL", "Combined Programming Language", "COMIT", "Common Intermediate Language", "Common Lisp", "COMPASS", "Component Pascal", "Constraint Handling Rules", "COMTRAN", "Cool", "Coq", "Coral 66", "CorVision", "COWSEL", "CPL", "Cryptol", "Crystal", "Csound", "Cuneiform", "Curl", "Curry", "Cybil", "Cyclone", "Cypher Query Language", "Cython", "CEEMAC", "edit", "D", "Dart", "Darwin", "DataFlex", "Datalog", "DATATRIEVE", "dBase", "dc", "DCL", "DinkC", "DIBOL", "Dog", "Draco", "DRAKON", "Dylan", "DYNAMO", "DAX (Data Analysis Expressions)", "edit", "E", "Ease", "Easy PL/I", "EASYTRIEVE PLUS", "eC", "ECMAScript", "Edinburgh IMP", "EGL", "Eiffel", "ELAN", "Elixir", "Elm", "Emacs Lisp", "Emerald", "Epigram", "EPL (Easy Programming Language)", "EPL (Eltron Programming Language)", "Erlang", "es", "Escher", "ESPOL", "Esterel", "Etoys", "Euclid", "Euler", "Euphoria", "EusLisp Robot Programming Language", "CMS EXEC", "EXEC 2", "Executable UML", "Ezhil", "edit", "F", "F#", "F*", "Factor", "Fantom", "FAUST", "FFP", "fish", "Fjölnir", "FL", "Flavors", "Flex", "FlooP", "FLOW-MATIC", "FOCAL", "FOCUS", "FOIL", "FORMAC", "@Formula", "Forth", "Fortran", "Fortress", "FP", "Franz Lisp", "Futhark", "F-Script", "edit", "Game Maker Language", "Scripting language", "GameMonkey Script", "GAMS", "GAP", "G-code", "GDScript", "Genie", "GDL", "GEORGE", "GLSL", "GNU E", "GNU Guile", "Go", "Go!", "GOAL", "Gödel", "Golo", "GOM (Good Old Mad)", "Google Apps Script", "Gosu", "GOTRAN", "GPSS", "GraphTalk", "GRASS", "Grasshopper", "Groovy", "edit", "Hack", "HAGGIS", "HAL/S", "Halide (programming language)", "Hamilton C shell", "Harbour", "Hartmann pipelines", "Haskell", "Haxe", "Hermes", "High Level Assembly", "HLSL", "Hollywood", "HolyC", "Hop", "Hopscotch", "Hope", "Hugo", "Hume", "HyperTalk", "edit", "Io", "Icon", "IBM Basic assembly language", "IBM HAScript", "IBM Informix-4GL", "IBM RPG", "IDL", "Idris", "Inform", "edit", "J", "J#", "J++", "JADE", "JAL", "Janus (concurrent constraint programming language)", "Janus (time-reversible computing programming language)", "JASS", "Java", "JavaFX Script", "JavaScript", "Scripting language", "Jess (programming language)", "JCL", "JEAN", "Join Java", "JOSS", "Joule", "JOVIAL", "Joy", "JScript", "JScript .NET", "Julia", "Jython", "edit", "K", "Kaleidoscope", "Karel", "KEE", "Kixtart", "Klerer-May System", "KIF", "Kojo", "Kotlin", "KRC", "KRL", "KUKA Robot Language", "KRYPTON", "Korn shell (ksh)", "Kodu", "Kv", "edit", "LabVIEW", "Ladder", "LANSA", "Lasso", "Lava", "LC-3", "Legoscript", "LIL", "LilyPond", "Limbo", "Limnor", "LINC", "Lingo", "LINQ", "LIS", "LISA", "Language H", "Lisp", "Lite-C", "Lithe", "Little b", "LLL", "Logo", "Logtalk", "LotusScript", "LPC", "LSE", "LSL", "LiveCode", "LiveScript", "Lua", "Lucid", "Lustre", "LYaPAS", "Lynx", "edit", "M2001", "M4", "M#", "Machine code", "MAD", "MAD/I", "Magik", "Magma", "Máni", "Maple", "MAPPER", "MARK-IV", "Mary", "MATLAB", "MASM Microsoft Assembly x86", "MATH-MATIC", "Maude system", "Maxima", "Macsyma", "Max", "MaxScript", "Maya (MEL)", "MDL", "Mercury", "Mesa", "Metafont", "MHEG-5 (Interactive TV programming language)", "Microcode", "MicroScript", "MIIS", "Milk (programming language)", "MIMIC", "Mirah", "Miranda", "MIVA Script", "ML", "Model 204", "Modelica", "Modula", "Modula-2", "Modula-3", "Mohol", "MOO", "Mortran", "Mouse", "MPD", "MSL", "MUMPS", "MuPAD", "Mutan", "Mystic Programming Language", "edit", "NASM", "Napier88", "Neko", "Nemerle", "NESL", "Net.Data", "NetLogo", "NetRexx", "NewLISP", "NEWP", "Newspeak", "NewtonScript", "Nial", "Nickle", "NITIN", "Nim", "Nix (Systems configuration language)", "NPL", "Not eXactly C", "Not Quite C", "NSIS", "Nu", "NWScript", "NXT-G", "edit", "o:XML", "Oak", "Oberon", "OBJ2", "Object Lisp", "ObjectLOGO", "Object REXX", "Object Pascal", "Objective-C", "Objective-J", "Obliq", "OCaml", "occam", "occam-π", "Octave", "OmniMark", "Opa", "Opal", "OpenCL", "OpenEdge ABL", "OPL", "OpenVera", "OPS5", "OptimJ", "Orc", "ORCA/Modula-2", "Oriel", "Orwell", "Oxygene", "Oz", "edit", "P", "P4", "P′′", "ParaSail (programming language)", "PARI/GP", "Pascal", "Pascal Script", "PCASTL", "PCF", "PEARL", "PeopleCode", "Perl", "PDL", "Pharo", "PHP", "Pico", "Picolisp", "Pict", "Pig (programming tool)", "Pike", "PILOT", "Pipelines", "Pizza", "PL-11", "PL/0", "PL/B", "PL/C", "PL/I", "PL/M", "PL/P", "PL/SQL", "PL360", "PLANC", "Plankalkül", "Planner", "PLEX", "PLEXIL", "Plus", "POP-11", "POP-2", "PostScript", "PortablE", "POV-Ray SDL", "Powerhouse", "PowerBuilder", "PowerShell", "PPL", "Processing", "Processing.js", "Prograph", "PROIV", "Prolog", "PROMAL", "Promela", "PROSE modeling language", "PROTEL", "ProvideX", "Pro*C", "Pure", "Pure Data", "PureScript", "Python", "edit", "Q (programming language from Kx Systems)", "Q# (Microsoft programming language)", "Qalb", "Quantum Computation Language", "QtScript", "QuakeC", "QPL", ".QL", "edit", "R", "R++", "Racket", "Raku", "RAPID", "Rapira", "Ratfiv", "Ratfor", "rc", "Reason", "REBOL", "Red", "Redcode", "REFAL", "REXX", "Rittle", "Rlab", "ROOP", "RPG", "RPL", "RSL", "RTL/2", "Ruby", "Rust", "edit", "S", "S2", "S3", "S-Lang", "S-PLUS", "SA-C", "SabreTalk", "SAIL", "SAM76", "SAS", "SASL", "Sather", "Sawzall", "Scala", "Scheme", "Scilab", "Scratch", "Script.NET", "Sed", "Seed7", "Self", "SenseTalk", "SequenceL", "Serpent", "SETL", "SIMPOL", "SIGNAL", "SiMPLE", "SIMSCRIPT", "Simula", "Simulink", "Singularity", "SISAL", "SLIP", "SMALL", "Smalltalk", "SML", "Strongtalk", "Snap!", "SNOBOL", "SPITBOL", "Snowball", "SOL", "Solidity", "SOPHAEROS", "Source", "SPARK", "Speakeasy", "Speedcode", "SPIN", "SP/k", "SPS", "SQL", "SQR", "Squeak", "Squirrel", "SR", "S/SL", "Starlogo", "Strand", "Stata", "Stateflow", "Subtext", "SBL", "SuperCollider", "SuperTalk", "Swift (Apple programming language)", "Swift (parallel scripting language)", "SYMPL", "SystemVerilog", "edit", "T", "TACL", "TACPOL", "TADS", "TAL", "Tcl", "Tea", "TECO", "TELCOMP", "TeX", "TEX", "TIE", "TMG", "Tom", "TOM", "Toi", "Topspeed", "TPU", "Trac", "TTM", "T-SQL", "Transcript", "TTCN", "Turing", "TUTOR", "TXL", "TypeScript", "Tynker", "edit", "Ubercode", "UCSD Pascal", "Umple", "Unicon", "Uniface", "UNITY", "Unix shell", "UnrealScript", "edit", "Vala", "Verilog", "VHDL", "Vim script", "Viper", "Visual DataFlex", "Visual DialogScript", "Visual FoxPro", "Visual J++", "Visual LISP", "Visual Objects", "Visual Prolog", "VSXu", "edit", "WATFIV, WATFOR", "WebAssembly", "WebDNA", "Whiley", "Winbatch", "Wolfram Language", "Wyvern", "edit", "X++", "X10", "XAML", "xBase", "xBase++", "XBL", "XC", "XMOS architecture", "xHarbour", "XL", "Xojo", "XOTcl", "XOD (programming language)", "XPL", "XPL0", "XQuery", "XSB", "XSharp", "XSLT", "Xtend", "edit", "YAML", "Yorick", "YQL", "Yoix", "YUI", "edit", "Z notation", "Zebra, ZPL, ZPL2", "Zeno", "ZetaLisp", "ZOPL", "Zsh", "ZPL", "Z++"]

  has_many :notes
  has_many :external_resources
  has_many :topics, through: :notes

  validates :name, inclusion: {in: POSSIBLE_NAMES}, uniqueness: true

  def self.possible_names
    POSSIBLE_NAMES
  end
  
  def external_resources
    note_resources = ExternalResource.find_by_sql("SELECT external_resources.* FROM external_resources INNER JOIN external_resources_notes ON external_resources_notes.external_resource_id = external_resources.id INNER JOIN (SELECT notes.* FROM notes WHERE notes.language_id = 4) AS n ON external_resources_notes.note_id = n.id")
    language_resources = self.external_resources
    note_resources + language_resources
  end

  # def self.external_resources<<(external_resource)

  # end
end
