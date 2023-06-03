import { useEffect } from "react";
import { useWindowMutators } from "../../../utils/recoil/window";

interface WindowDimentionsProps {
  children: React.ReactNode;
}

export const WindowDimentionsProvider: React.FC<WindowDimentionsProps> = ({
  children,
}) => {
  const { setWindowHeight, setWindowWidth } = useWindowMutators();
  useEffect(() => {
    setWindowHeight(window.innerHeight);
    setWindowWidth(window.innerWidth);
  }, []);
  return <>{children}</>;
};
