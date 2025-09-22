package main

import (
	"embed"
	"log"

	"{{.ProjectName}}/backend"
	"github.com/wailsapp/wails/v2"
	"github.com/wailsapp/wails/v2/pkg/logger"
	"github.com/wailsapp/wails/v2/pkg/menu"
	"github.com/wailsapp/wails/v2/pkg/menu/keys"
	"github.com/wailsapp/wails/v2/pkg/options"
	"github.com/wailsapp/wails/v2/pkg/options/assetserver"
	"github.com/wailsapp/wails/v2/pkg/options/linux"
	"github.com/wailsapp/wails/v2/pkg/options/mac"
	"github.com/wailsapp/wails/v2/pkg/options/windows"
)

//go:embed all:frontend/dist
var assets embed.FS

//go:embed target/appicon.png
var icon []byte

func main() {
	// Create an instance of the app structure
	app := {{.ProjectName}}.NewApp()

	// 🔹 Criar menu nativo
	appMenu := menu.NewMenu()

	// Menu "Arquivo"
	fileMenu := appMenu.AddSubmenu("Arquivo")
	fileMenu.AddText("Novo", keys.CmdOrCtrl("n"), func(_ *menu.CallbackData) {
	})
	fileMenu.AddText("Abrir", keys.CmdOrCtrl("o"), func(_ *menu.CallbackData) {
	})
	fileMenu.AddSeparator()
	fileMenu.AddText("Sair", keys.CmdOrCtrl("q"), func(_ *menu.CallbackData) {
	})

	// Menu "Ajuda"
	helpMenu := appMenu.AddSubmenu("Ajuda")
	helpMenu.AddText("Sobre", nil, func(_ *menu.CallbackData) {
		log.Println()
	})

	// Create application with options
	err := wails.Run(&options.App{
		Title:             "{{.ProjectName}}",
		Width:             1024,
		Height:            768,
		MinWidth:          800,
		MinHeight:         480,
		MaxWidth:          1280,
		MaxHeight:         800,
		DisableResize:     false,
		Fullscreen:        false,
		StartHidden:       false,
		HideWindowOnClose: false,
		Frameless:         false,
		AlwaysOnTop:       false,

		EnableDefaultContextMenu: false,
		DragAndDrop: &options.DragAndDrop{
			EnableFileDrop:     true,
			DisableWebViewDrop: false,
			CSSDropProperty:    "--wails-drop-target",
			CSSDropValue:       "drop",
		},

		BackgroundColour: &options.RGBA{R: 0, G: 0, B: 0, A: 0},
		AssetServer: &assetserver.Options{
			Assets: assets,
		},
		Menu:             appMenu,
		Logger:           nil,
		LogLevel:         logger.DEBUG,
		OnStartup:        app.Startup,
		OnDomReady:       app.DomReady,
		OnBeforeClose:    app.BeforeClose,
		OnShutdown:       app.Shutdown,
		WindowStartState: options.Normal,
		Bind: []any{
			app,
		},
		// Windows platform specific options
		Windows: &windows.Options{
			WebviewIsTransparent:              true,
			WindowIsTranslucent:               true,
			DisableWindowIcon:                 false,
			DisableFramelessWindowDecorations: false,
			WebviewUserDataPath:               "",
			ZoomFactor:                        1.0,
		},
		// Mac platform specific options
		Mac: &mac.Options{
			// SEE: https://wails.io/docs/next/reference/options/#titlebar
			TitleBar: &mac.TitleBar{
				TitlebarAppearsTransparent: false,
				HideTitle:                  false,
				HideTitleBar:               false,
				FullSizeContent:            true,
				UseToolbar:                 false,
				HideToolbarSeparator:       true,
			},
			Appearance:           mac.NSAppearanceNameDarkAqua,
			WebviewIsTransparent: true,
			WindowIsTranslucent:  true,
			About: &mac.AboutInfo{
				Title:   "{{.ProjectName}}",
				Message: "© 2025 {{.AuthorName}}",
				Icon:    icon,
			},
		},
		// Linux platform specific options
		Linux: &linux.Options{
			Icon:                icon,
			WindowIsTranslucent: true,
			WebviewGpuPolicy:    linux.WebviewGpuPolicyNever,
			ProgramName:         "{{.ProjectName}}",
		},
		Debug: options.Debug{
			OpenInspectorOnStartup: false,
		},
	})

	if err != nil {
		log.Fatal(err)
	}
}
