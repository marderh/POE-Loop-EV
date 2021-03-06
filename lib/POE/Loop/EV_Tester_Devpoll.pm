=for poe_tests
BEGIN { $ENV{LIBEV_FLAGS} = 16; }
sub skip_tests {
    return "Author and automated testing only"
        unless $ENV{AUTHOR_TESTING} or $ENV{AUTOMATED_TESTING};
    return "EV module with devpoll backend could not be loaded" if (
        do { eval "use EV"; $@ }
    );
    return "EV was not built with a devpoll backend"
        if EV::backend() != EV::BACKEND_DEVPOLL();
    diag("Using EV with devpoll backend") if shift eq '00_info';
}
