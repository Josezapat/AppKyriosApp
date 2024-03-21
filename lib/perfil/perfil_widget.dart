import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'perfil_model.dart';
export 'perfil_model.dart';

class PerfilWidget extends StatefulWidget {
  const PerfilWidget({super.key});

  @override
  State<PerfilWidget> createState() => _PerfilWidgetState();
}

class _PerfilWidgetState extends State<PerfilWidget> {
  late PerfilModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PerfilModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 160.0,
            decoration: BoxDecoration(
              color: Color(0xD61A107B),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 40.0, 20.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: FlutterFlowTheme.of(context).alternate,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(2.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CachedNetworkImage(
                          fadeInDuration: Duration(milliseconds: 500),
                          fadeOutDuration: Duration(milliseconds: 500),
                          imageUrl:
                              'data:image/jpeg;base64,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',
                          width: 80.0,
                          height: 80.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AuthUserStreamWidget(
                            builder: (context) => Text(
                              currentUserDisplayName,
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context).info,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: Text(
                              currentUserEmail,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xB4FFFFFF),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
            child: Material(
              color: Colors.transparent,
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                width: double.infinity,
                height: 60.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3.0,
                      color: Color(0x33000000),
                      offset: Offset(0.0, 1.0),
                    )
                  ],
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    width: 0.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 4.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (loggedIn) {
                        context.pushNamed('EditarPerfil');
                      } else {
                        context.pushNamed('Login');
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          loggedIn ? 'Editar Perfil' : 'Iniciar Sesión',
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Montserrat',
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
            child: Material(
              color: Colors.transparent,
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                width: double.infinity,
                height: 60.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3.0,
                      color: Color(0x33000000),
                      offset: Offset(0.0, 1.0),
                    )
                  ],
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    width: 0.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 4.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (loggedIn) {
                        context.pushNamed('MisPedidos');
                      } else {
                        context.pushNamed('Login');
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          loggedIn ? 'Mis Pedidos' : 'Iniciar Sesión',
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Montserrat',
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 100.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 3.0,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  offset: Offset(0.0, 1.0),
                )
              ],
              border: Border.all(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(60.0, 24.0, 0.0, 40.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          GoRouter.of(context).prepareAuthEvent();
                          await authManager.signOut();
                          GoRouter.of(context).clearRedirectLocation();

                          context.pushNamedAuth('HOME', context.mounted);
                        },
                        text: 'Cerrar Sesión',
                        icon: Icon(
                          Icons.output_outlined,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          width: 130.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFF4A0707),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xFFFBFCFD),
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Align(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 40.0, 40.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.safePop();
                        },
                        text: 'Regresar',
                        options: FFButtonOptions(
                          width: 120.0,
                          height: 50.0,
                          padding: EdgeInsets.all(0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFF070707),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xFFFBFCFD),
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3.0,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    offset: Offset(0.0, 1.0),
                  )
                ],
                borderRadius: BorderRadius.circular(0.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
            ),
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
                              color: FlutterFlowTheme.of(context).primaryText,
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
                            color: FlutterFlowTheme.of(context).primaryText,
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
                              color: FlutterFlowTheme.of(context).primaryText,
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
                                color: FlutterFlowTheme.of(context).primaryText,
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
    );
  }
}
