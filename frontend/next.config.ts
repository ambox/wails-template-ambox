import type { NextConfig } from "next";

const nextConfig: NextConfig = {
	/* config options here */
	output: "export",
	distDir: 'dist',
	allowedDevOrigins: ["wails.localhost"]
};

export default nextConfig;
