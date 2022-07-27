import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_bloc_flutter/src/core/components/base_view_pagee.dart';
import 'package:weather_app_bloc_flutter/src/core/components/card_day_prevision_component.dart';
import 'package:weather_app_bloc_flutter/src/core/components/card_info_component.dart';
import 'package:weather_app_bloc_flutter/src/core/components/three_bounce_component.dart';
import 'package:weather_app_bloc_flutter/src/core/infra/components/bloc_builder.dart';
import 'package:weather_app_bloc_flutter/src/core/infra/components/page_widget.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_dimension.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_extension.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_fonts.dart';
import 'package:weather_app_bloc_flutter/src/models/weather_icon_model.dart';
import 'package:weather_app_bloc_flutter/src/models/weather_model.dart';
import 'package:weather_app_bloc_flutter/src/modules/home/controller/home_bloc.dart';

class HomePage extends PageWidget<HomeBloc> {
  HomePage({Key? key}) : super(key: key);

  @override
  void onInit(BuildContext context) {
    bloc.getWeather();
    super.onInit(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is HomeLoading || state is HomeInitial) {
            return const Center(
              child: ThreeBounceComponent(
                color: AppExtension.primary,
              ),
            );
          }

          if (state is HomeError) {
            return Center(
              child: BaseViewPage(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.warning_amber_rounded,
                    size: AppDimension.size_5,
                    color: AppExtension.primary,
                  ),
                  AppDimension.spacing_2,
                  Text(
                    state.message,
                    style: AppFonts.titleLarge(),
                  ),
                  AppDimension.spacing_0,
                  Text(
                    'Nosso app precisa da sua localização para que possamos mostra as condições do tempo na sua região!',
                    style: AppFonts.bodyLarge(light: true),
                    textAlign: TextAlign.center,
                  ),
                  AppDimension.spacing_2,
                  Text(
                    'Se por acaso você negou permanetemente a permissão, limpe o cache do aplicativo, ou desinstale e instale novamente!',
                    style: AppFonts.bodyLarge(light: true),
                    textAlign: TextAlign.center,
                  ),
                  AppDimension.spacing_5,
                  ElevatedButton(
                    onPressed: () => bloc.getWeather(),
                    child: const Text('Tentar Novamente'),
                  ),
                ],
              ),
            );
          }

          if (state is HomeSuccess) {
            return BaseViewPage(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCity(state.weather),
                _buildPrevision(state.weather),
                _buildInfo(state.weather),
                _buildDaysPrevision(state.weather),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildDaysPrevision(WeatherModel weather) {
    return SizedBox(
      height: 115,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final forecast = weather.forecast[index];

          return CardDayPrevisionComponent(
            forecast: forecast,
            icon: WeatherIconModel.weatherIcons[forecast.condition].toString(),
          );
        },
        itemCount: weather.forecast.length,
        separatorBuilder: (__, _) => const SizedBox(
          width: AppDimension.size_2,
        ),
      ),
    );
  }

  Widget _buildInfo(WeatherModel weather) {
    return Column(
      children: [
        CardInfoComponent(
          info: weather.time,
          title: 'Atualizado às',
          icon: FontAwesomeIcons.clock,
        ),
        CardInfoComponent(
          title: 'Vento',
          icon: FontAwesomeIcons.wind,
          info: weather.windSpeedy,
        ),
        CardInfoComponent(
          title: 'Humidade do ar',
          icon: FontAwesomeIcons.droplet,
          info: '${weather.humidity.toString()} %',
        ),
      ],
    );
  }

  Widget _buildPrevision(WeatherModel weather) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SvgPicture.asset(
          WeatherIconModel.weatherIcons[weather.conditionSlug].toString(),
          color: AppExtension.primary,
          height: 115,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${weather.temp} °',
              style: AppFonts.displayLarge().copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              weather.description,
              style: AppFonts.bodyLarge(light: true),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCity(WeatherModel weather) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          weather.city,
          style: AppFonts.headlineLarge(),
        ),
        AppDimension.spacing_0,
        Text(
          DateFormat("EEEE,  MMM d", "pt_BR").format(DateTime.now()),
          style: AppFonts.bodyLarge(light: true),
        ),
      ],
    );
  }
}
