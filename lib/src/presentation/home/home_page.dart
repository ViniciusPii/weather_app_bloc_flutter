import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_bloc_flutter/src/app_env.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_styles.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/infra/app_colors.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/infra/app_dimension.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/infra/app_fonts.dart';
import 'package:weather_app_bloc_flutter/src/core/ui/base_bloc_state.dart';
import 'package:weather_app_bloc_flutter/src/core/ui/components/spacing_page.dart';
import 'package:weather_app_bloc_flutter/src/core/ui/components/three_bounce_component.dart';
import 'package:weather_app_bloc_flutter/src/domain/entities/weather_entity.dart';
import 'package:weather_app_bloc_flutter/src/presentation/home/controller/home_bloc.dart';
import 'package:weather_app_bloc_flutter/src/presentation/home/widgets/card_day_prevision_component.dart';
import 'package:weather_app_bloc_flutter/src/presentation/home/widgets/card_info_component.dart';
import 'package:weather_app_bloc_flutter/src/presentation/home/widgets/home_error_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseBlocState<HomePage, HomeBloc> {
  @override
  void onReady(BuildContext context) {
    controller.getWeatherByCurrentLocation();
    super.onReady(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: controller,
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(child: ThreeBounceComponent());
          }

          if (state is HomeErrorState) {
            return HomeErrorWidget(
              title: state.title,
              message: state.message,
              action: () => controller.getWeatherByCurrentLocation(),
            );
          }

          if (state is HomeSuccessState) {
            return SafeArea(
              child: SpacingPage(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCity(state.weather),
                    _buildPrevision(state.weather),
                    _buildInfo(state.weather),
                    _buildDaysPrevision(state.weather),
                  ],
                ),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildCity(WeatherEntity weather) {
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
              const SizedBox(
                height: AppDimension.small,
              ),
              Text(
                DateFormat("EEEE,  MMM d", "pt_BR").format(DateTime.now()),
                style: AppFonts.bodyLarge(light: true),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () => controller.getWeatherByCurrentLocation(),
          icon: const Icon(
            Icons.refresh_rounded,
            size: AppDimension.big,
            color: AppStyles.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildPrevision(WeatherEntity weather) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SvgPicture.network(
          AppEnv.imagePath(weather.conditionSlug),
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

  Widget _buildInfo(WeatherEntity weather) {
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
          color: AppColors.blue600,
          icon: FontAwesomeIcons.droplet,
          info: '${weather.humidity.toString()} %',
        ),
      ],
    );
  }

  Widget _buildDaysPrevision(WeatherEntity weather) {
    return SizedBox(
      height: 115,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final forecast = weather.forecast[index];

          return CardDayPrevisionComponent(
            forecast: forecast,
            icon: AppEnv.imagePath(forecast.condition),
          );
        },
        itemCount: weather.forecast.length,
        separatorBuilder: (__, _) => const SizedBox(
          width: AppDimension.large,
        ),
      ),
    );
  }
}
