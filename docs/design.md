wsrv/
├── src/                   # Source files for the project
│   ├── main.asm          # Entry point of the application
│   ├── server.asm        # Core server logic (socket setup, accept loop)
│   ├── request.asm       # HTTP request parsing logic
│   ├── response.asm      # HTTP response generation logic
│   ├── file.asm          # File handling utilities
│   ├── api.asm           # RESTful API handlers
│   ├── fhir.asm          # FHIR JSON data serving logic
│   └── utils.asm         # General utilities (e.g., string manipulation)
├── include/              # Header files for reusable definitions
│   ├── macros.inc        # Common macros for code reuse
│   └── constants.inc     # Constants (e.g., buffer sizes, HTTP status codes)
├── lib/                  # Placeholder for future library components
│   └── (empty for now)
├── build/                # Output directory for compiled artifacts
│   ├── wsrv.o            # Object files (example)
│   └── wsrv              # Final executable binary
├── docs/                 # Documentation
│   └── design.md         # Design and architecture documentation
├── tests/                # Testing scripts
│   └── test_scripts.sh   # Shell scripts for automated testing
└── Makefile              # Build automation script
