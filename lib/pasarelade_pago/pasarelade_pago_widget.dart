import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pasarelade_pago_model.dart';
export 'pasarelade_pago_model.dart';

class PasareladePagoWidget extends StatefulWidget {
  const PasareladePagoWidget({super.key});

  @override
  State<PasareladePagoWidget> createState() => _PasareladePagoWidgetState();
}

class _PasareladePagoWidgetState extends State<PasareladePagoWidget> {
  late PasareladePagoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PasareladePagoModel());

    _model.yourNameController1 ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.direccion, ''));
    _model.yourNameFocusNode1 ??= FocusNode();

    _model.yourNameController2 ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.referencias, ''));
    _model.yourNameFocusNode2 ??= FocusNode();

    _model.yourNameController3 ??=
        TextEditingController(text: currentUserDisplayName);
    _model.yourNameFocusNode3 ??= FocusNode();

    _model.yourNameController4 ??=
        TextEditingController(text: currentPhoneNumber);
    _model.yourNameFocusNode4 ??= FocusNode();

    _model.yourNameController5 ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.dni, 0).toString());
    _model.yourNameFocusNode5 ??= FocusNode();

    _model.yourNameController6 ??= TextEditingController();
    _model.yourNameFocusNode6 ??= FocusNode();

    _model.nombrecompletoController ??= TextEditingController();
    _model.nombrecompletoFocusNode ??= FocusNode();

    _model.emailController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    _model.tarjetaController ??= TextEditingController();
    _model.tarjetaFocusNode ??= FocusNode();

    _model.mesController ??= TextEditingController();
    _model.mesFocusNode ??= FocusNode();

    _model.yearController ??= TextEditingController();
    _model.yearFocusNode ??= FocusNode();

    _model.claveController ??= TextEditingController();
    _model.claveFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CartRecord>>(
      stream: queryCartRecord(
        queryBuilder: (cartRecord) => cartRecord
            .where(
              'creator',
              isEqualTo: currentUserReference,
            )
            .where(
              'isActive',
              isEqualTo: true,
            ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<CartRecord> pasareladePagoCartRecordList = snapshot.data!;
        final pasareladePagoCartRecord = pasareladePagoCartRecordList.isNotEmpty
            ? pasareladePagoCartRecordList.first
            : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                leading: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.safePop();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ),
                actions: [],
              ),
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    'Datos de Envío',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FlutterFlowRadioButton(
                                        options: [
                                          'Envío a Domicilio',
                                          'Recoger en Tienda'
                                        ].toList(),
                                        onChanged: (val) => setState(() {}),
                                        controller: _model
                                                .radioButtonValueController1 ??=
                                            FormFieldController<String>(
                                                'Envío a Domicilio'),
                                        optionHeight: 32.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                            ),
                                        selectedTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                ),
                                        buttonPosition:
                                            RadioButtonPosition.left,
                                        direction: Axis.vertical,
                                        radioButtonColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        inactiveRadioButtonColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        toggleable: false,
                                        horizontalAlignment:
                                            WrapAlignment.start,
                                        verticalAlignment:
                                            WrapCrossAlignment.start,
                                      ),
                                    ],
                                  ),
                                ),
                                if (_model.radioButtonValue1 ==
                                    'Envío a Domicilio')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 15.0, 0.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) =>
                                          StreamBuilder<List<DestinoRecord>>(
                                        stream: queryDestinoRecord(
                                          queryBuilder: (destinoRecord) =>
                                              destinoRecord.orderBy('Ciudad'),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<DestinoRecord>
                                              ciudadDestinoRecordList =
                                              snapshot.data!;
                                          return FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .ciudadValueController1 ??=
                                                FormFieldController<String>(
                                              _model.ciudadValue1 ??=
                                                  valueOrDefault(
                                                      currentUserDocument
                                                          ?.ciudad,
                                                      ''),
                                            ),
                                            options: ciudadDestinoRecordList
                                                .map((e) => e.ciudad)
                                                .toList(),
                                            onChanged: (val) => setState(() =>
                                                _model.ciudadValue1 = val),
                                            width: 335.0,
                                            height: 50.0,
                                            searchHintTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                    ),
                                            searchTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                    ),
                                            hintText: 'Ciudad - Distrito',
                                            searchHintText:
                                                'Search for an item...',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 2.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            hidesUnderline: true,
                                            isSearchable: true,
                                            isMultiSelect: false,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                if (_model.radioButtonValue1 ==
                                    'Recoger en Tienda')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 15.0, 0.0, 0.0),
                                    child: StreamBuilder<List<TiendaRecord>>(
                                      stream: queryTiendaRecord(
                                        queryBuilder: (tiendaRecord) =>
                                            tiendaRecord.orderBy('Tiendas'),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<TiendaRecord>
                                            ciudadTiendaRecordList =
                                            snapshot.data!;
                                        return FlutterFlowDropDown<String>(
                                          controller:
                                              _model.ciudadValueController2 ??=
                                                  FormFieldController<String>(
                                            _model.ciudadValue2 ??=
                                                'Cercado de Lima - Av. Roosevelt 201',
                                          ),
                                          options: ciudadTiendaRecordList
                                              .map((e) => e.tiendas)
                                              .toList(),
                                          onChanged: (val) => setState(
                                              () => _model.ciudadValue2 = val),
                                          width: 335.0,
                                          height: 50.0,
                                          searchHintTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                  ),
                                          searchTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                  ),
                                          hintText: 'Ciudad - Distrito',
                                          searchHintText:
                                              'Search for an item...',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          borderWidth: 2.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 4.0),
                                          hidesUnderline: true,
                                          isSearchable: true,
                                          isMultiSelect: false,
                                        );
                                      },
                                    ),
                                  ),
                                if (_model.radioButtonValue1 ==
                                    'Envío a Domicilio')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 16.0, 20.0, 16.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => TextFormField(
                                        controller: _model.yourNameController1,
                                        focusNode: _model.yourNameFocusNode1,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Tu direccion',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                  ),
                                          hintText: 'Tu direccion',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 24.0, 0.0, 24.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                            ),
                                        validator: _model
                                            .yourNameController1Validator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                if (_model.radioButtonValue1 ==
                                    'Envío a Domicilio')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 16.0, 20.0, 16.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => TextFormField(
                                        controller: _model.yourNameController2,
                                        focusNode: _model.yourNameFocusNode2,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Referencias',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                  ),
                                          hintText:
                                              'Referencias para llegar a tu destino',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 24.0, 0.0, 24.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                            ),
                                        validator: _model
                                            .yourNameController2Validator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 16.0, 20.0, 16.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => TextFormField(
                                      controller: _model.yourNameController3,
                                      focusNode: _model.yourNameFocusNode3,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Nombre Completo',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Montserrat',
                                            ),
                                        hintText: 'Tu nombre',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Montserrat',
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20.0, 24.0, 0.0, 24.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                          ),
                                      validator: _model
                                          .yourNameController3Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 16.0, 20.0, 16.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => TextFormField(
                                      controller: _model.yourNameController4,
                                      focusNode: _model.yourNameFocusNode4,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'WhatsApp',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Montserrat',
                                            ),
                                        hintText: 'tu número de celular',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Montserrat',
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20.0, 24.0, 0.0, 24.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                          ),
                                      validator: _model
                                          .yourNameController4Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 16.0, 20.0, 16.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => TextFormField(
                                      controller: _model.yourNameController5,
                                      focusNode: _model.yourNameFocusNode5,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'DNI o RUC',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Montserrat',
                                            ),
                                        hintText:
                                            'Documento de Identidad o Ruc',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Montserrat',
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20.0, 24.0, 0.0, 24.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                          ),
                                      validator: _model
                                          .yourNameController5Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 16.0, 20.0, 16.0),
                                        child: TextFormField(
                                          controller:
                                              _model.yourNameController6,
                                          focusNode: _model.yourNameFocusNode6,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Cupón de Descuento',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                    ),
                                            hintText: 'Cupón (Opcional)',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 24.0, 0.0, 24.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                              ),
                                          validator: _model
                                              .yourNameController6Validator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 15.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await currentUserReference!
                                              .update(createUserRecordData(
                                            cupon:
                                                _model.yourNameController6.text,
                                          ));
                                        },
                                        text: 'Aplicar',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowRadioButton(
                              options: [
                                'Tarjeta de crédito o débito',
                                'Transferencia, Yape o Plin'
                              ].toList(),
                              onChanged: (val) => setState(() {}),
                              controller: _model.radioButtonValueController2 ??=
                                  FormFieldController<String>(
                                      'Tarjeta de crédito o débito'),
                              optionHeight: 32.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                  ),
                              selectedTextStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                  ),
                              buttonPosition: RadioButtonPosition.left,
                              direction: Axis.vertical,
                              radioButtonColor:
                                  FlutterFlowTheme.of(context).primary,
                              inactiveRadioButtonColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              toggleable: false,
                              horizontalAlignment: WrapAlignment.start,
                              verticalAlignment: WrapCrossAlignment.start,
                            ),
                          ],
                        ),
                        if (_model.radioButtonValue2 ==
                            'Transferencia, Yape o Plin')
                          Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Pagar',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontSize: 17.0,
                                          ),
                                    ),
                                    Icon(
                                      Icons.phone_iphone,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FlutterFlowRadioButton(
                                      options: ['Yape o Plin'].toList(),
                                      onChanged: (val) => setState(() {}),
                                      controller:
                                          _model.radioButtonValueController3 ??=
                                              FormFieldController<String>(
                                                  'Yape o Plin'),
                                      optionHeight: 50.0,
                                      optionWidth: 350.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      selectedTextStyle:
                                          FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                              ),
                                      buttonPosition: RadioButtonPosition.left,
                                      direction: Axis.vertical,
                                      radioButtonColor:
                                          FlutterFlowTheme.of(context).primary,
                                      inactiveRadioButtonColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      toggleable: false,
                                      horizontalAlignment: WrapAlignment.start,
                                      verticalAlignment:
                                          WrapCrossAlignment.start,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 10.0),
                                            child: Text(
                                              'Método de pago con Yape o Plin al 933625741, cuando se realice el pago se debe adjuntar el comprobante con el justificante de pedido.\nYape: Publicidad Kyrios E.I.R.L\nPin: Sixto Zapata Villaverde',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                      ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(25.0),
                                                child: CachedNetworkImage(
                                                  fadeInDuration: Duration(
                                                      milliseconds: 500),
                                                  fadeOutDuration: Duration(
                                                      milliseconds: 500),
                                                  imageUrl:
                                                      'https://seeklogo.com/images/Y/yape-logo-3E473EE7E5-seeklogo.com.png',
                                                  width: 100.0,
                                                  height: 100.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: CachedNetworkImage(
                                                  fadeInDuration: Duration(
                                                      milliseconds: 500),
                                                  fadeOutDuration: Duration(
                                                      milliseconds: 500),
                                                  imageUrl:
                                                      'https://seeklogo.com/images/P/plin-logo-967A4AF583-seeklogo.com.png',
                                                  width: 100.0,
                                                  height: 100.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FlutterFlowRadioButton(
                                      options: [
                                        'Transferencia BCP, Interbank, BBVA y Banco de la Nación'
                                      ].toList(),
                                      onChanged: (val) => setState(() {}),
                                      controller: _model
                                              .radioButtonValueController4 ??=
                                          FormFieldController<String>(
                                              'Transferencia BCP, Interbank, BBVA y Banco de la Nación'),
                                      optionHeight: 50.0,
                                      optionWidth: 350.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      selectedTextStyle:
                                          FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                              ),
                                      buttonPosition: RadioButtonPosition.left,
                                      direction: Axis.vertical,
                                      radioButtonColor:
                                          FlutterFlowTheme.of(context).primary,
                                      inactiveRadioButtonColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      toggleable: false,
                                      horizontalAlignment: WrapAlignment.start,
                                      verticalAlignment:
                                          WrapCrossAlignment.start,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 10.0),
                                            child: Text(
                                              'Puedes pagar depositando en nuestras cuentas:\nCta Corriente BCP 191-1625957-0-06\nCta Corriente Interbank 049-3002937327\nCta Independencia BBVA 0011-0814-0221513822\nCta Scotiabank 8206406988\nCta Banco de la Nación 04-020-492312\nTransferencia interbancaria CCI 00219100162595700653\nNombre: PUBLICIDAD KYRIOS EIRL\nRUC: 20510942711',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 500),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 500),
                                                    imageUrl:
                                                        'https://play-lh.googleusercontent.com/gBpVaCpZsbBrLufT06aRpuLQvsUq1KAZUCEof_ps76mtB8_llJg3xv24mey8I0m3dUE',
                                                    width: 50.0,
                                                    height: 50.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 500),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 500),
                                                    imageUrl:
                                                        'https://play-lh.googleusercontent.com/vjYx0jloYA0BSr6fHPhvhhIbgieH0jmOV3fv_evGkj9bxxjITNO3Yhfux77bq2_HvBIF',
                                                    width: 50.0,
                                                    height: 50.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 500),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 500),
                                                    imageUrl:
                                                        'https://play-lh.googleusercontent.com/ZsRXxnAaNfWkGh0znnApV1d2BnTysMJVgZSAG5i4xX5c3weg6C0IGr6rtkqWMrXZriA',
                                                    width: 50.0,
                                                    height: 50.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 500),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 500),
                                                    imageUrl:
                                                        'https://play-lh.googleusercontent.com/bX-2nxLIzRoDZBf_wMVI_VIB8NgnochPebM8aDMGe3wqEYz6dSQZsJjZ4F5j8OMM86S2',
                                                    width: 50.0,
                                                    height: 50.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 500),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 500),
                                                    imageUrl:
                                                        'https://play-lh.googleusercontent.com/C_0_84IUToLUXrXn48RENqvYD-xDnJfH-8GUgGfZ2QQ-Z7x-mheyeRRLbVsk1t44y85a',
                                                    width: 50.0,
                                                    height: 50.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 20.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            _model.uploadedFileUrl,
                                            'https://cdn-icons-png.flaticon.com/512/6583/6583130.png',
                                          ),
                                          width: 100.0,
                                          height: 100.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            final selectedMedia =
                                                await selectMedia(
                                              mediaSource:
                                                  MediaSource.photoGallery,
                                              multiImage: false,
                                            );
                                            if (selectedMedia != null &&
                                                selectedMedia.every((m) =>
                                                    validateFileFormat(
                                                        m.storagePath,
                                                        context))) {
                                              setState(() => _model
                                                  .isDataUploading = true);
                                              var selectedUploadedFiles =
                                                  <FFUploadedFile>[];

                                              var downloadUrls = <String>[];
                                              try {
                                                showUploadMessage(
                                                  context,
                                                  'Uploading file...',
                                                  showLoading: true,
                                                );
                                                selectedUploadedFiles =
                                                    selectedMedia
                                                        .map((m) =>
                                                            FFUploadedFile(
                                                              name: m
                                                                  .storagePath
                                                                  .split('/')
                                                                  .last,
                                                              bytes: m.bytes,
                                                              height: m
                                                                  .dimensions
                                                                  ?.height,
                                                              width: m
                                                                  .dimensions
                                                                  ?.width,
                                                              blurHash:
                                                                  m.blurHash,
                                                            ))
                                                        .toList();

                                                downloadUrls =
                                                    (await Future.wait(
                                                  selectedMedia.map(
                                                    (m) async =>
                                                        await uploadData(
                                                            m.storagePath,
                                                            m.bytes),
                                                  ),
                                                ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                              } finally {
                                                ScaffoldMessenger.of(context)
                                                    .hideCurrentSnackBar();
                                                _model.isDataUploading = false;
                                              }
                                              if (selectedUploadedFiles
                                                          .length ==
                                                      selectedMedia.length &&
                                                  downloadUrls.length ==
                                                      selectedMedia.length) {
                                                setState(() {
                                                  _model.uploadedLocalFile =
                                                      selectedUploadedFiles
                                                          .first;
                                                  _model.uploadedFileUrl =
                                                      downloadUrls.first;
                                                });
                                                showUploadMessage(
                                                    context, 'Success!');
                                              } else {
                                                setState(() {});
                                                showUploadMessage(context,
                                                    'Failed to upload data');
                                                return;
                                              }
                                            }
                                          },
                                          text: 'Adjuntar Archivo',
                                          icon: Icon(
                                            Icons.download,
                                            size: 15.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: 180.0,
                                            height: 40.0,
                                            padding: EdgeInsets.all(0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (_model.radioButtonValue2 ==
                            'Tarjeta de crédito o débito')
                          Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Pagar',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontSize: 17.0,
                                          ),
                                    ),
                                    Icon(
                                      Icons.credit_card,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        Container(
                          decoration: BoxDecoration(),
                          child: Visibility(
                            visible: _model.radioButtonValue2 ==
                                'Tarjeta de crédito o débito',
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 16.0, 20.0, 16.0),
                                    child: TextFormField(
                                      controller:
                                          _model.nombrecompletoController,
                                      focusNode: _model.nombrecompletoFocusNode,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Nombre completo',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Montserrat',
                                            ),
                                        hintText: 'Nombre completo',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Montserrat',
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20.0, 24.0, 0.0, 24.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                          ),
                                      validator: _model
                                          .nombrecompletoControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 16.0, 20.0, 16.0),
                                    child: TextFormField(
                                      controller: _model.emailController,
                                      focusNode: _model.emailFocusNode,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Correo Electrónico',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Montserrat',
                                            ),
                                        hintText: 'Correo Electrónico',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Montserrat',
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20.0, 24.0, 0.0, 24.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                          ),
                                      validator: _model.emailControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 16.0, 20.0, 16.0),
                                    child: TextFormField(
                                      controller: _model.tarjetaController,
                                      focusNode: _model.tarjetaFocusNode,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            'Número de Tarjeta [aaaaaaaaaaaaaaaa]',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Montserrat',
                                            ),
                                        hintText: 'Número de Tarjeta',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Montserrat',
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20.0, 24.0, 0.0, 24.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                          ),
                                      validator: _model
                                          .tarjetaControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 120.0,
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 16.0, 0.0, 16.0),
                                              child: TextFormField(
                                                controller:
                                                    _model.mesController,
                                                focusNode: _model.mesFocusNode,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Mes [aa]',
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                          ),
                                                  hintText: 'Mes',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                          ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(20.0, 24.0,
                                                              0.0, 24.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                        ),
                                                validator: _model
                                                    .mesControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 120.0,
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 16.0, 20.0, 16.0),
                                              child: TextFormField(
                                                controller:
                                                    _model.yearController,
                                                focusNode: _model.yearFocusNode,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Año [aaaa]',
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                          ),
                                                  hintText: 'Año',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                          ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(20.0, 24.0,
                                                              0.0, 24.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 14.0,
                                                        ),
                                                validator: _model
                                                    .yearControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 120.0,
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 16.0, 20.0, 16.0),
                                              child: TextFormField(
                                                controller:
                                                    _model.claveController,
                                                focusNode:
                                                    _model.claveFocusNode,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'CVV [aaa]',
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                          ),
                                                  hintText: 'CVV',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                          ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(20.0, 24.0,
                                                              0.0, 24.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                        ),
                                                validator: _model
                                                    .claveControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 392.0,
                  height: 140.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      StreamBuilder<List<CuponesRecord>>(
                        stream: queryCuponesRecord(
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<CuponesRecord> columnCuponesRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final columnCuponesRecord =
                              columnCuponesRecordList.isNotEmpty
                                  ? columnCuponesRecordList.first
                                  : null;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 4.0, 24.0, 4.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Subtotal',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Montserrat',
                                                fontSize: 14.0,
                                              ),
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 36.0,
                                          icon: Icon(
                                            Icons.info_outlined,
                                            color: Color(0xFF57636C),
                                            size: 18.0,
                                          ),
                                          showLoadingIndicator: true,
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                      ],
                                    ),
                                    StreamBuilder<List<Cupon10Record>>(
                                      stream: queryCupon10Record(
                                        singleRecord: true,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<Cupon10Record>
                                            textCupon10RecordList =
                                            snapshot.data!;
                                        // Return an empty Container when the item does not exist.
                                        if (snapshot.data!.isEmpty) {
                                          return Container();
                                        }
                                        final textCupon10Record =
                                            textCupon10RecordList.isNotEmpty
                                                ? textCupon10RecordList.first
                                                : null;
                                        return Text(
                                          formatNumber(
                                            pasareladePagoCartRecord!.amount,
                                            formatType: FormatType.decimal,
                                            decimalType: DecimalType.automatic,
                                            currency: 's/',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall
                                              .override(
                                                fontFamily: 'Montserrat',
                                                fontSize: 18.0,
                                              ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 4.0, 24.0, 4.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Envío',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Montserrat',
                                                fontSize: 14.0,
                                              ),
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 36.0,
                                          icon: Icon(
                                            Icons.info_outlined,
                                            color: Color(0xFF57636C),
                                            size: 18.0,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                      ],
                                    ),
                                    AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        () {
                                          if (_model.radioButtonValue1 ==
                                              'Recoger en Tienda') {
                                            return 's/0';
                                          } else if (valueOrDefault(
                                                  currentUserDocument?.cupon,
                                                  '') ==
                                              columnCuponesRecord?.cupones) {
                                            return 's/0';
                                          } else {
                                            return () {
                                              if ((_model.ciudadValue1 == 'Callao - Bellavista') ||
                                                  (_model.ciudadValue1 ==
                                                      'Callao - Callao') ||
                                                  (_model.ciudadValue1 ==
                                                      'Callao - Carmen de la Legua Reynoso') ||
                                                  (_model.ciudadValue1 ==
                                                      'Callao - La Perla') ||
                                                  (_model.ciudadValue1 ==
                                                      'Callao - La Punta') ||
                                                  (_model.ciudadValue1 ==
                                                      'Callao - Mi Peru') ||
                                                  (_model.ciudadValue1 ==
                                                      'Callao - Ventanilla') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - Ancon') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - Ate') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - Barranco') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - Breña') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - Carabayllo') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - Cercado de Lima') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - Chaclacayo') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - Chorrillos') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - Cieneguilla') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - Comas') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - El Agustino') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - Independencia') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - Jesus Maria') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - La Molina') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - La Victoria') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - Lince') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - Los Olivos') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - Lurigancho - Chosica') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - Lurin') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - Magdalena del Mar') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - Miraflores') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - Pachacamac') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - Pucusana') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - Pueblo Libre') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - Puente Piedra') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - Punta Hermosa') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - Punta Negra') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - Rimac') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - San Bartolo') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - San Borja') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - San Isidro') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - San Juan de Lurigancho') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - San Juan de Miraflores') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - San Luis') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - San Martin de Porres') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - San Martin de Porres') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - Santa Anita') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - Santa Maria del Mar') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - Santa Rosa') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - Surco (Santiago de Surco)') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - Surquillo') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - Villa El Salvador') ||
                                                  (_model.ciudadValue1 ==
                                                      'Lima - Villa Maria del Triunfo')) {
                                                return 's/15';
                                              } else if ((_model.ciudadValue1 ==
                                                      'Loreto - Nauta') ||
                                                  (_model.ciudadValue1 ==
                                                      'Loreto - Parinari') ||
                                                  (_model.ciudadValue1 ==
                                                      'Loreto - Tigre') ||
                                                  (_model.ciudadValue1 ==
                                                      'Loreto - Trompeteros') ||
                                                  (_model.ciudadValue1 ==
                                                      'Loreto - Urarinas')) {
                                                return 's/35';
                                              } else {
                                                return 's/20';
                                              }
                                            }();
                                          }
                                        }(),
                                        style: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .override(
                                              fontFamily: 'Montserrat',
                                              fontSize: 18.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 4.0, 24.0, 4.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Total a Pagar',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Montserrat',
                                              ),
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 36.0,
                                          icon: Icon(
                                            Icons.info_outlined,
                                            color: Color(0xFF57636C),
                                            size: 18.0,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                      ],
                                    ),
                                    AuthUserStreamWidget(
                                      builder: (context) =>
                                          StreamBuilder<List<Cupon10Record>>(
                                        stream: queryCupon10Record(
                                          singleRecord: true,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<Cupon10Record>
                                              textCupon10RecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the item does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final textCupon10Record =
                                              textCupon10RecordList.isNotEmpty
                                                  ? textCupon10RecordList.first
                                                  : null;
                                          return Text(
                                            _model.radioButtonValue1 ==
                                                    'Envío a Domicilio'
                                                ? (valueOrDefault(
                                                            currentUserDocument
                                                                ?.cupon,
                                                            '') ==
                                                        columnCuponesRecord
                                                            ?.cupones
                                                    ? formatNumber(
                                                        pasareladePagoCartRecord!
                                                            .amount,
                                                        formatType:
                                                            FormatType.decimal,
                                                        decimalType: DecimalType
                                                            .automatic,
                                                        currency: 's/',
                                                      )
                                                    : () {
                                                        if ((_model.ciudadValue1 == 'Callao - Bellavista') ||
                                                            (_model.ciudadValue1 ==
                                                                'Callao - Callao') ||
                                                            (_model.ciudadValue1 ==
                                                                'Callao - Carmen de la Legua Reynoso') ||
                                                            (_model.ciudadValue1 ==
                                                                'Callao - La Perla') ||
                                                            (_model.ciudadValue1 ==
                                                                'Callao - La Punta') ||
                                                            (_model.ciudadValue1 ==
                                                                'Callao - Mi Peru') ||
                                                            (_model.ciudadValue1 ==
                                                                'Callao - Ventanilla') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - Ancon') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - Ate') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - Barranco') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - Breña') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - Carabayllo') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - Cercado de Lima') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - Chaclacayo') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - Chorrillos') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - Cieneguilla') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - Comas') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - El Agustino') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - Independencia') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - Jesus Maria') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - La Molina') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - La Victoria') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - Lince') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - Los Olivos') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - Lurigancho - Chosica') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - Lurin') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - Magdalena del Mar') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - Miraflores') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - Pachacamac') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - Pucusana') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - Pueblo Libre') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - Puente Piedra') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - Punta Hermosa') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - Punta Negra') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - Rimac') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - San Bartolo') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - San Borja') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - San Isidro') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - San Juan de Lurigancho') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - San Juan de Miraflores') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - San Luis') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - San Martin de Porres') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - San Martin de Porres') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - Santa Anita') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - Santa Maria del Mar') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - Santa Rosa') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - Surco (Santiago de Surco)') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - Surquillo') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - Villa El Salvador') ||
                                                            (_model.ciudadValue1 ==
                                                                'Lima - Villa Maria del Triunfo')) {
                                                          return formatNumber(
                                                            functions.envio(
                                                                pasareladePagoCartRecord!
                                                                    .amount),
                                                            formatType:
                                                                FormatType
                                                                    .decimal,
                                                            decimalType:
                                                                DecimalType
                                                                    .automatic,
                                                            currency: 's/',
                                                          );
                                                        } else if ((_model
                                                                    .ciudadValue1 ==
                                                                'Loreto - Nauta') ||
                                                            (_model.ciudadValue1 ==
                                                                'Loreto - Parinari') ||
                                                            (_model.ciudadValue1 ==
                                                                'Loreto - Tigre') ||
                                                            (_model.ciudadValue1 ==
                                                                'Loreto - Trompeteros') ||
                                                            (_model.ciudadValue1 ==
                                                                'Loreto - Urarinas')) {
                                                          return formatNumber(
                                                            functions.enviolejos(
                                                                pasareladePagoCartRecord!
                                                                    .amount),
                                                            formatType:
                                                                FormatType
                                                                    .decimal,
                                                            decimalType:
                                                                DecimalType
                                                                    .automatic,
                                                            currency: 's/',
                                                          );
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.cupon,
                                                                '') ==
                                                            columnCuponesRecord
                                                                ?.cupones) {
                                                          return formatNumber(
                                                            pasareladePagoCartRecord!
                                                                .amount,
                                                            formatType:
                                                                FormatType
                                                                    .decimal,
                                                            decimalType:
                                                                DecimalType
                                                                    .automatic,
                                                            currency: 's/',
                                                          );
                                                        } else {
                                                          return formatNumber(
                                                            functions.envioprovincia(
                                                                pasareladePagoCartRecord!
                                                                    .amount),
                                                            formatType:
                                                                FormatType
                                                                    .decimal,
                                                            decimalType:
                                                                DecimalType
                                                                    .automatic,
                                                            currency: 's/',
                                                          );
                                                        }
                                                      }())
                                                : formatNumber(
                                                    pasareladePagoCartRecord!
                                                        .amount,
                                                    formatType:
                                                        FormatType.decimal,
                                                    decimalType:
                                                        DecimalType.automatic,
                                                    currency: 's/',
                                                  ),
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 25.0,
                                                ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    if (_model.radioButtonValue2 ==
                        'Transferencia, Yape o Plin')
                      Container(
                        width: double.infinity,
                        height: 55.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x320E151B),
                              offset: Offset(0.0, -2.0),
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                        ),
                        alignment: AlignmentDirectional(0.0, -0.35),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            StreamBuilder<List<OrderRecord>>(
                              stream: queryOrderRecord(
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<OrderRecord> buttonOrderRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final buttonOrderRecord =
                                    buttonOrderRecordList.isNotEmpty
                                        ? buttonOrderRecordList.first
                                        : null;
                                return FFButtonWidget(
                                  onPressed: () async {
                                    if (_model.uploadedFileUrl == null ||
                                        _model.uploadedFileUrl == '') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Debes de Adjuntar un Comprobante de Pago',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 1800),
                                          backgroundColor: Color(0xFFF40409),
                                        ),
                                      );
                                    } else {
                                      if (_model.yourNameController1.text ==
                                              null ||
                                          _model.yourNameController1.text ==
                                              '') {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Escribe tu Dirección de Entrega',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 1800),
                                            backgroundColor: Color(0xFFF40409),
                                          ),
                                        );
                                      } else {
                                        if (_model.yourNameController2.text ==
                                                null ||
                                            _model.yourNameController2.text ==
                                                '') {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Escribe Referencias del Destino',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 1800),
                                              backgroundColor:
                                                  Color(0xFFF40409),
                                            ),
                                          );
                                        } else {
                                          if (_model.yourNameController5.text ==
                                                  null ||
                                              _model.yourNameController5.text ==
                                                  '') {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'DNI es obligatorio',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 1800),
                                                backgroundColor:
                                                    Color(0xFFF40409),
                                              ),
                                            );
                                          } else {
                                            if (_model.yourNameController4
                                                        .text ==
                                                    null ||
                                                _model.yourNameController4
                                                        .text ==
                                                    '') {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Número de WhatsApp Obligatorio',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 1800),
                                                  backgroundColor:
                                                      Color(0xFFF40409),
                                                ),
                                              );
                                            } else {
                                              var orderRecordReference =
                                                  OrderRecord.collection.doc();
                                              await orderRecordReference.set({
                                                ...createOrderRecordData(
                                                  name: currentUserDisplayName,
                                                  amount:
                                                      pasareladePagoCartRecord
                                                          ?.amount,
                                                  status: 'en espera',
                                                  createdAt:
                                                      getCurrentTimestamp,
                                                  creator: currentUserReference,
                                                  cart: pasareladePagoCartRecord
                                                      ?.reference,
                                                  nombre: _model
                                                      .yourNameController3.text,
                                                  numero: int.tryParse(_model
                                                      .yourNameController4
                                                      .text),
                                                  dni: int.tryParse(_model
                                                      .yourNameController5
                                                      .text),
                                                  direccion: _model
                                                      .yourNameController1.text,
                                                  referencias: _model
                                                      .yourNameController2.text,
                                                  ciudad:
                                                      _model.radioButtonValue1 ==
                                                              'Envío a Domicilio'
                                                          ? _model.ciudadValue1
                                                          : _model.ciudadValue2,
                                                  pago: _model.uploadedFileUrl,
                                                  cupon: _model
                                                      .yourNameController6.text,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'selectedItems':
                                                        pasareladePagoCartRecord
                                                            ?.selectedItemsList,
                                                  },
                                                ),
                                              });
                                              _model.ordenCopy = OrderRecord
                                                  .getDocumentFromData({
                                                ...createOrderRecordData(
                                                  name: currentUserDisplayName,
                                                  amount:
                                                      pasareladePagoCartRecord
                                                          ?.amount,
                                                  status: 'en espera',
                                                  createdAt:
                                                      getCurrentTimestamp,
                                                  creator: currentUserReference,
                                                  cart: pasareladePagoCartRecord
                                                      ?.reference,
                                                  nombre: _model
                                                      .yourNameController3.text,
                                                  numero: int.tryParse(_model
                                                      .yourNameController4
                                                      .text),
                                                  dni: int.tryParse(_model
                                                      .yourNameController5
                                                      .text),
                                                  direccion: _model
                                                      .yourNameController1.text,
                                                  referencias: _model
                                                      .yourNameController2.text,
                                                  ciudad:
                                                      _model.radioButtonValue1 ==
                                                              'Envío a Domicilio'
                                                          ? _model.ciudadValue1
                                                          : _model.ciudadValue2,
                                                  pago: _model.uploadedFileUrl,
                                                  cupon: _model
                                                      .yourNameController6.text,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'selectedItems':
                                                        pasareladePagoCartRecord
                                                            ?.selectedItemsList,
                                                  },
                                                ),
                                              }, orderRecordReference);

                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'orderList':
                                                        FieldValue.arrayUnion([
                                                      _model
                                                          .ordenCopy?.reference
                                                    ]),
                                                  },
                                                ),
                                              });

                                              context.pushNamed(
                                                'finalizado',
                                                queryParameters: {
                                                  'orden': serializeParam(
                                                    _model.ordenCopy,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'orden': _model.ordenCopy,
                                                },
                                              );
                                            }
                                          }
                                        }
                                      }
                                    }

                                    setState(() {});
                                  },
                                  text: 'Confirmar Pedido',
                                  options: FFButtonOptions(
                                    width: 170.0,
                                    height: 100.0,
                                    padding: EdgeInsets.all(0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          fontSize: 16.0,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    if (_model.radioButtonValue2 ==
                        'Tarjeta de crédito o débito')
                      StreamBuilder<List<CuponesRecord>>(
                        stream: queryCuponesRecord(
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<CuponesRecord> containerCuponesRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final containerCuponesRecord =
                              containerCuponesRecordList.isNotEmpty
                                  ? containerCuponesRecordList.first
                                  : null;
                          return Container(
                            width: double.infinity,
                            height: 55.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x320E151B),
                                  offset: Offset(0.0, -2.0),
                                )
                              ],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0),
                              ),
                            ),
                            alignment: AlignmentDirectional(0.0, -0.35),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                StreamBuilder<List<OrderRecord>>(
                                  stream: queryOrderRecord(
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<OrderRecord> buttonOrderRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final buttonOrderRecord =
                                        buttonOrderRecordList.isNotEmpty
                                            ? buttonOrderRecordList.first
                                            : null;
                                    return FFButtonWidget(
                                      onPressed: () async {
                                        if (_model.yourNameController1.text ==
                                                null ||
                                            _model.yourNameController1.text ==
                                                '') {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Escribe tu Dirección de Entrega',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 1800),
                                              backgroundColor:
                                                  Color(0xFFF40409),
                                            ),
                                          );
                                        } else {
                                          if (_model.yourNameController2.text ==
                                                  null ||
                                              _model.yourNameController2.text ==
                                                  '') {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Escribe Referencias del Destino',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 1800),
                                                backgroundColor:
                                                    Color(0xFFF40409),
                                              ),
                                            );
                                          } else {
                                            if (_model.yourNameController5
                                                        .text ==
                                                    null ||
                                                _model.yourNameController5
                                                        .text ==
                                                    '') {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'DNI es obligatorio',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 1800),
                                                  backgroundColor:
                                                      Color(0xFFF40409),
                                                ),
                                              );
                                            } else {
                                              if (_model.yourNameController4
                                                          .text ==
                                                      null ||
                                                  _model.yourNameController4
                                                          .text ==
                                                      '') {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Número de WhatsApp Obligatorio',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 1800),
                                                    backgroundColor:
                                                        Color(0xFFF40409),
                                                  ),
                                                );
                                              } else {
                                                _model.creartokerCard =
                                                    await ObtenerTokenCardCall
                                                        .call(
                                                  publicKey:
                                                      'APP_USR-303edd89-bf5b-4a22-a04d-86d78caceb92',
                                                  accessToken:
                                                      'APP_USR-7939906161455432-020110-1cec1bd387040e1807f8574a50c4535b-738395231',
                                                  cardNumber: _model
                                                      .tarjetaController.text,
                                                  cardholderName: _model
                                                      .nombrecompletoController
                                                      .text,
                                                  securityCode: _model
                                                      .claveController.text,
                                                  cardExpirationMonth:
                                                      int.tryParse(_model
                                                          .mesController.text),
                                                  cardExpirationYear:
                                                      int.tryParse(_model
                                                          .yearController.text),
                                                );
                                                if ((_model.creartokerCard
                                                        ?.succeeded ??
                                                    true)) {
                                                  _model.pagar =
                                                      await CrearPagoTarjetaCall
                                                          .call(
                                                    accessToken:
                                                        'APP_USR-7939906161455432-020110-1cec1bd387040e1807f8574a50c4535b-738395231',
                                                    transactionAmount: () {
                                                      if (_model
                                                              .radioButtonValue1 ==
                                                          'Envío a Domicilio') {
                                                        return () {
                                                          if (valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.cupon,
                                                                  '') ==
                                                              containerCuponesRecord
                                                                  ?.cupones) {
                                                            return functions
                                                                .cuponmasenvio(
                                                                    pasareladePagoCartRecord!
                                                                        .amount);
                                                          } else if (valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.cupon,
                                                                  '') ==
                                                              containerCuponesRecord
                                                                  ?.cupones) {
                                                            return functions
                                                                .cuponmasenvio10(
                                                                    pasareladePagoCartRecord!
                                                                        .amount);
                                                          } else {
                                                            return functions.envio(
                                                                pasareladePagoCartRecord!
                                                                    .amount);
                                                          }
                                                        }();
                                                      } else if (_model
                                                              .radioButtonValue1 ==
                                                          'Recoger en Tienda') {
                                                        return () {
                                                          if (valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.cupon,
                                                                  '') ==
                                                              containerCuponesRecord
                                                                  ?.cupones) {
                                                            return functions.cupon(
                                                                pasareladePagoCartRecord!
                                                                    .amount);
                                                          } else if (valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.cupon,
                                                                  '') ==
                                                              containerCuponesRecord
                                                                  ?.cupones) {
                                                            return functions.cupon10(
                                                                pasareladePagoCartRecord!
                                                                    .amount);
                                                          } else {
                                                            return pasareladePagoCartRecord
                                                                ?.amount;
                                                          }
                                                        }();
                                                      } else {
                                                        return pasareladePagoCartRecord
                                                            ?.amount;
                                                      }
                                                    }(),
                                                    tokenTarjeta: getJsonField(
                                                      (_model.creartokerCard
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.id''',
                                                    ).toString(),
                                                    description:
                                                        'Pedido de la App de Kyrios',
                                                    email: _model
                                                        .emailController.text,
                                                    installments: 1,
                                                  );
                                                  if ((_model
                                                          .pagar?.succeeded ??
                                                      true)) {
                                                    var orderRecordReference =
                                                        OrderRecord.collection
                                                            .doc();
                                                    await orderRecordReference
                                                        .set({
                                                      ...createOrderRecordData(
                                                        name:
                                                            currentUserDisplayName,
                                                        amount:
                                                            pasareladePagoCartRecord
                                                                ?.amount,
                                                        status: 'en espera',
                                                        createdAt:
                                                            getCurrentTimestamp,
                                                        creator:
                                                            currentUserReference,
                                                        cart:
                                                            pasareladePagoCartRecord
                                                                ?.reference,
                                                        nombre: _model
                                                            .yourNameController3
                                                            .text,
                                                        numero: int.tryParse(_model
                                                            .yourNameController4
                                                            .text),
                                                        dni: int.tryParse(_model
                                                            .yourNameController5
                                                            .text),
                                                        direccion: _model
                                                            .yourNameController1
                                                            .text,
                                                        referencias: _model
                                                            .yourNameController2
                                                            .text,
                                                        ciudad: _model
                                                                    .radioButtonValue1 ==
                                                                'Envío a Domicilio'
                                                            ? _model
                                                                .ciudadValue1
                                                            : _model
                                                                .ciudadValue2,
                                                        pago:
                                                            'https://d31dn7nfpuwjnm.cloudfront.net/images/valoraciones/0034/7801/diferencia-tarjeta-credito-debito.png?1565359275',
                                                        cupon: _model
                                                            .yourNameController6
                                                            .text,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'selectedItems':
                                                              pasareladePagoCartRecord
                                                                  ?.selectedItemsList,
                                                        },
                                                      ),
                                                    });
                                                    _model.orden = OrderRecord
                                                        .getDocumentFromData({
                                                      ...createOrderRecordData(
                                                        name:
                                                            currentUserDisplayName,
                                                        amount:
                                                            pasareladePagoCartRecord
                                                                ?.amount,
                                                        status: 'en espera',
                                                        createdAt:
                                                            getCurrentTimestamp,
                                                        creator:
                                                            currentUserReference,
                                                        cart:
                                                            pasareladePagoCartRecord
                                                                ?.reference,
                                                        nombre: _model
                                                            .yourNameController3
                                                            .text,
                                                        numero: int.tryParse(_model
                                                            .yourNameController4
                                                            .text),
                                                        dni: int.tryParse(_model
                                                            .yourNameController5
                                                            .text),
                                                        direccion: _model
                                                            .yourNameController1
                                                            .text,
                                                        referencias: _model
                                                            .yourNameController2
                                                            .text,
                                                        ciudad: _model
                                                                    .radioButtonValue1 ==
                                                                'Envío a Domicilio'
                                                            ? _model
                                                                .ciudadValue1
                                                            : _model
                                                                .ciudadValue2,
                                                        pago:
                                                            'https://d31dn7nfpuwjnm.cloudfront.net/images/valoraciones/0034/7801/diferencia-tarjeta-credito-debito.png?1565359275',
                                                        cupon: _model
                                                            .yourNameController6
                                                            .text,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'selectedItems':
                                                              pasareladePagoCartRecord
                                                                  ?.selectedItemsList,
                                                        },
                                                      ),
                                                    }, orderRecordReference);

                                                    await currentUserReference!
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'orderList':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            _model.orden
                                                                ?.reference
                                                          ]),
                                                        },
                                                      ),
                                                    });

                                                    context.pushNamed(
                                                      'finalizado',
                                                      queryParameters: {
                                                        'orden': serializeParam(
                                                          _model.orden,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'orden': _model.orden,
                                                      },
                                                    );
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('Fallo'),
                                                          content: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                            getJsonField(
                                                              (_model.pagar
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.message''',
                                                            )?.toString(),
                                                            'MensajeError',
                                                          )),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  }
                                                } else {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('Fallo'),
                                                        content: Text(
                                                            valueOrDefault<
                                                                String>(
                                                          getJsonField(
                                                            (_model.creartokerCard
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.message''',
                                                          )?.toString(),
                                                          'mensjaeError',
                                                        )),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                }
                                              }
                                            }
                                          }
                                        }

                                        setState(() {});
                                      },
                                      text: 'Confirmar Pedido',
                                      options: FFButtonOptions(
                                        width: 170.0,
                                        height: 100.0,
                                        padding: EdgeInsets.all(0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontSize: 16.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    width: double.infinity,
                    height: 57.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('Configuracion');
                                  },
                                  child: Icon(
                                    Icons.settings_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 32.0,
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('HOME');
                                },
                                child: Icon(
                                  Icons.home,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 32.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 15.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('Perfil');
                                  },
                                  child: Icon(
                                    Icons.person,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 32.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Ajustes',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 12.0,
                                      ),
                                ),
                              ),
                              Text(
                                'Inicio',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 12.0,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    7.0, 0.0, 15.0, 0.0),
                                child: Text(
                                  'Perfil',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 12.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
