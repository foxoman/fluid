include(doc_shared.pri)

DOC_OUTDIR_POSTFIX = /html
DOC_HTML_INSTALLDIR = $$LIRI_INSTALL_DOCDIR/fluid
DOC_QCH_OUTDIR = $$OUT_PWD/doc
DOC_QCH_INSTALLDIR = $$LIRI_INSTALL_DOCDIR/fluid

OTHER_FILES += \
    $$PWD/fluid.qdocconf \
    $$PWD/fluid-online.qdocconf

include(doc_targets.pri)
