import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app_bloc_flutter/src/core/components/base_view_pagee.dart';
import 'package:weather_app_bloc_flutter/src/core/components/card_day_prevision_component.dart';
import 'package:weather_app_bloc_flutter/src/core/components/card_info_component.dart';
import 'package:weather_app_bloc_flutter/src/core/infra/components/page_widget.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_dimension.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_extension.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_fonts.dart';
import 'package:weather_app_bloc_flutter/src/modules/home/controller/home_bloc.dart';

class HomePage extends PageWidget<HomeBloc> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseViewPage(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCity(),
          _buildPrevision(),
          _buildInfo(),
          _buildDaysPrevision(),
        ],
      ),
    );
  }

  Widget _buildDaysPrevision() {
    return SizedBox(
      height: 135,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const CardDayPrevisionComponent(
            max: '34 °',
            min: '14 °',
            day: 'Seg',
            icon: FontAwesomeIcons.cloud,
            condition: 'Chuva',
          );
        },
        itemCount: 10,
        separatorBuilder: (__, _) => const SizedBox(
          width: AppDimension.size_2,
        ),
      ),
    );
  }

  Widget _buildInfo() {
    return Column(
      children: const [
        CardInfoComponent(
          icon: FontAwesomeIcons.clock,
          title: 'Hora da consulta',
          info: '19:11',
        ),
        CardInfoComponent(
          icon: FontAwesomeIcons.wind,
          title: 'Vento',
          info: '2.57 km/h',
        ),
        CardInfoComponent(
          icon: FontAwesomeIcons.droplet,
          title: 'Humidade do ar',
          info: '89 %',
        ),
      ],
    );
  }

  Widget _buildPrevision() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Icon(
          FontAwesomeIcons.cloudBolt,
          size: AppDimension.size_10,
          color: AppExtension.primary,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '19 °',
              style: AppFonts.displayLarge().copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Trovoadas',
              style: AppFonts.bodyLarge(light: true),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hortolandia',
          style: AppFonts.headlineLarge(),
        ),
        AppDimension.spacing_0,
        Text(
          'Segunda, Jul 25',
          style: AppFonts.bodyLarge(light: true),
        ),
      ],
    );
  }
}
