=for poe_tests
BEGIN { $ENV{LIBEV_FLAGS} = 32; }
sub skip_tests {
    return "EV module with port backend could not be loaded" if (
        do { eval "use EV"; $@ }
    );
    return "EV was not built with a port backend" if EV::backend() != 32;
    return "Skipping test k_run_returns" if $_[0] eq 'k_run_returns';
}
