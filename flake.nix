{
  description = "My (exlee) personal templates";

  outputs = { self }: {
    templates = {
      rust-quick = {
        path = ./rust-quick;
        description = "Rust Quickstart";
      };
      souffle-with-rust = {
        path = ./souffle-with-rust;
        description = "Soufflé with Rust Functors";
      };
      instant-prolog = {
        path = ./instant-prolog;
        description = "Instant SWI-Prolog Development";
      };
    };
  };
}
