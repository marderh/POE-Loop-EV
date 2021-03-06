=for poe_tests
BEGIN { $ENV{LIBEV_FLAGS} = 1; }
sub skip_tests {
    return "Author and automated testing only"
        unless $ENV{AUTHOR_TESTING} or $ENV{AUTOMATED_TESTING};
    return "EV module with select backend could not be loaded" if (
        do { eval "use EV"; $@ }
    );
    return "EV was not built with a select backend"
        if EV::backend() != EV::BACKEND_SELECT();
    diag("Using EV with select backend") if shift eq '00_info';
}
