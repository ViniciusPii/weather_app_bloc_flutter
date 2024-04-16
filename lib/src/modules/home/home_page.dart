import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_bloc_flutter/src/core/components/base_view_component.dart';
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
import 'package:weather_app_bloc_flutter/src/modules/home/widgets/home_error_widget.dart';

class HomePage extends PageWidget<HomeBloc> {
  HomePage({super.key});

  @override
  void onInit(BuildContext context) {
    bloc.getPositionAndWeather();
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
          } else if (state is HomeGeolocationError) {
            return HomeErrorWidget(
              title: state.message,
              info:
                  'Precisamos da sua localização para que possamos mostrar a condição do tempo na sua região!',
              fun: () => bloc.getPositionAndWeather(),
            );
          } else if (state is HomeError) {
            return HomeErrorWidget(
              title: state.message,
              info:
                  'Verifique sua conexão com a internet ou tente novamente para buscar o tempo na sua região!',
              fun: () => bloc.getPositionAndWeather(),
            );
          } else if (state is HomeSuccess) {
            return BaseViewComponent(
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

  Widget _buildCity(WeatherModel weather) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
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
          ),
        ),
        IconButton(
          onPressed: () => bloc.getPositionAndWeather(),
          icon: const Icon(
            Icons.refresh_rounded,
            size: AppDimension.size_4,
            color: AppExtension.primary,
          ),
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
          height: 115,
          colorFilter: const ColorFilter.mode(
            AppExtension.primary,
            BlendMode.srcIn,
          ),
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
}
