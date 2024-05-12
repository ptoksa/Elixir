{application,phoenix_live_dashboard,
             [{optional_applications,[ecto_psql_extras,ecto_mysql_extras,
                                      ecto_sqlite3_extras,ecto]},
              {applications,[kernel,stdlib,elixir,logger,mime,
                             phoenix_live_view,telemetry_metrics,
                             ecto_psql_extras,ecto_mysql_extras,
                             ecto_sqlite3_extras,ecto]},
              {description,"Real-time performance dashboard for Phoenix"},
              {modules,['Elixir.Inspect.Phoenix.LiveDashboard.PageLive',
                        'Elixir.Phoenix.LiveDashboard',
                        'Elixir.Phoenix.LiveDashboard.AppInfoComponent',
                        'Elixir.Phoenix.LiveDashboard.Application',
                        'Elixir.Phoenix.LiveDashboard.ApplicationsPage',
                        'Elixir.Phoenix.LiveDashboard.Assets',
                        'Elixir.Phoenix.LiveDashboard.ChartComponent',
                        'Elixir.Phoenix.LiveDashboard.EctoStatsPage',
                        'Elixir.Phoenix.LiveDashboard.EtsInfoComponent',
                        'Elixir.Phoenix.LiveDashboard.EtsPage',
                        'Elixir.Phoenix.LiveDashboard.Helpers',
                        'Elixir.Phoenix.LiveDashboard.HomePage',
                        'Elixir.Phoenix.LiveDashboard.LayeredGraphComponent',
                        'Elixir.Phoenix.LiveDashboard.LayeredGraphComponent.Arrow',
                        'Elixir.Phoenix.LiveDashboard.LayeredGraphComponent.Circle',
                        'Elixir.Phoenix.LiveDashboard.LayoutView',
                        'Elixir.Phoenix.LiveDashboard.LoggerPubSubBackend',
                        'Elixir.Phoenix.LiveDashboard.MemoryAllocatorsPage',
                        'Elixir.Phoenix.LiveDashboard.MetricsPage',
                        'Elixir.Phoenix.LiveDashboard.ModalComponent',
                        'Elixir.Phoenix.LiveDashboard.NavBarComponent',
                        'Elixir.Phoenix.LiveDashboard.OSMonPage',
                        'Elixir.Phoenix.LiveDashboard.PageBuilder',
                        'Elixir.Phoenix.LiveDashboard.PageLive',
                        'Elixir.Phoenix.LiveDashboard.PageNotFound',
                        'Elixir.Phoenix.LiveDashboard.PortInfoComponent',
                        'Elixir.Phoenix.LiveDashboard.PortsPage',
                        'Elixir.Phoenix.LiveDashboard.ProcessInfoComponent',
                        'Elixir.Phoenix.LiveDashboard.ProcessesPage',
                        'Elixir.Phoenix.LiveDashboard.ReingoldTilford',
                        'Elixir.Phoenix.LiveDashboard.ReingoldTilford.Line',
                        'Elixir.Phoenix.LiveDashboard.ReingoldTilford.Node',
                        'Elixir.Phoenix.LiveDashboard.RequestLogger',
                        'Elixir.Phoenix.LiveDashboard.RequestLoggerPage',
                        'Elixir.Phoenix.LiveDashboard.Router',
                        'Elixir.Phoenix.LiveDashboard.SocketInfoComponent',
                        'Elixir.Phoenix.LiveDashboard.SocketsPage',
                        'Elixir.Phoenix.LiveDashboard.SystemInfo',
                        'Elixir.Phoenix.LiveDashboard.SystemInfo.PortDetails',
                        'Elixir.Phoenix.LiveDashboard.SystemInfo.ProcessDetails',
                        'Elixir.Phoenix.LiveDashboard.TableComponent',
                        'Elixir.Phoenix.LiveDashboard.TelemetryListener',
                        'Elixir.Phoenix.LiveDashboard.TitleBarComponent',
                        'Elixir.Phoenix.LiveDashboard.Web']},
              {registered,[]},
              {vsn,"0.8.1"},
              {mod,{'Elixir.Phoenix.LiveDashboard.Application',[]}}]}.